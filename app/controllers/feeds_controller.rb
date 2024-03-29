class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]

  # GET /feeds or /feeds.json
  def index
    if  current_user && current_user.admin?
      redirect_to current_user
    else
    require 'open-uri'
    require 'geocoder'
    require 'country_select'
    require 'rspotify'

    remote_ip = URI.open('https://ident.me').read

    Forecast.delete_all
    ActiveRecord::Base.connection.execute(
      "DELETE from sqlite_sequence where name = 'forecasts'"
    )

    #forecast controller
    url = 'http://api.openweathermap.org/geo/1.0/direct'
    uri = URI.parse(url)
    query = Rack::Utils.parse_query(uri.query)

    if params[:place] == nil || params[:place] == ''
      query["q"] = Geocoder.search(remote_ip).first.city
    else
      query["q"] = params[:place]
    end
    
    query["limit"] = "5"

    query["appid"] = Rails.application.credentials.dig(:openweather, :apiKey)

    uri.query = Rack::Utils.build_query(query)
    optUrl = uri.to_s

    req = URI.open(optUrl)
   
    response_body = req.read
    unless response_body == "[]"
    puts(response_body)
     
    data = JSON.parse(response_body)
   
    name = data[0]["name"]

    lat = data[0]["lat"]
    lon = data[0]["lon"]

    url2 = 'https://api.openweathermap.org/data/2.5/weather'
    uri2 = URI.parse(url2)
    query2 = Rack::Utils.parse_query(uri2.query)

    query2["lat"] = lat
    query2["lon"] = lon

    query2["appid"] = query["appid"]

    uri2.query = Rack::Utils.build_query(query2)
    optUrl2 = uri2.to_s

    req2 = URI.open(optUrl2)
    response_body2 = req2.read
    data2 = JSON.parse(response_body2)

    ow_icon = "http://openweathermap.org/img/wn/#{data2["weather"][0]["icon"]}@4x.png"
    temp = (data2["main"]["temp"] - 273.15).round(1)
    temp_min = (data2["main"]["temp_min"] - 273.15).round(1)
    temp_max = (data2["main"]["temp_max"] - 273.15).round(1)

    Forecast.create(
      place: data[0]["name"],
      lat: query2["lat"],
      lon: query2["lon"],
      weather: data2["weather"][0]["main"],
      description: data2["weather"][0]["description"],
      icon: ow_icon,
      temp: temp,
      temp_min: temp_min,
      temp_max: temp_max,
      pressure: data2["main"]["pressure"],
      humidity: data2["main"]["humidity"],
      sea_level: data2["main"]["sea_level"],
      grnd_level: data2["main"]["grnd_level"]
    )
  end
    #playlist controller
    RSpotify::authenticate(Rails.application.credentials.dig(:spotify, :clientID), Rails.application.credentials.dig(:spotify, :clientSecret))
    
    if params[:country] == nil || params[:country] == ''
      featured_playlists = RSpotify::Playlist.browse_featured(country: Geocoder.search(remote_ip).first.country_code)
    else
      featured_playlists = RSpotify::Playlist.browse_featured(country: params[:country])
    end

    psize = featured_playlists.size-1
    
    begin
      for i in 0..psize do
        if Playlist.where(name: featured_playlists[i].name,
          spotify_url: featured_playlists[i].external_urls["spotify"],
          description: featured_playlists[i].description).empty? && Blacklist.where(name: featured_playlists[i].name,spotify_url: featured_playlists[i].external_urls["spotify"]).empty?
            Playlist.create(
            country: params[:country],
            name: featured_playlists[i].name,
            description: featured_playlists[i].description,
            spotify_url: featured_playlists[i].external_urls["spotify"],
            spotify_img: featured_playlists[i].images[0]["url"],
            tracks: featured_playlists[i].tracks.map{|t| [
              t.name,
              t.artists.map{|a| a.name},
              t.album.images[0]["url"],
              t.external_urls["spotify"],
              t.preview_url,
            ]}        
          )
        end
      end
    rescue RestClient::ServiceUnavailable
      redirect_to "/pages/err_503"
    end

    #article controller
    url = 'https://newsapi.org/v2/top-headlines'
    uri = URI.parse(url)
    query = Rack::Utils.parse_query(uri.query)
    
    if (params[:country] == nil && params[:category] == nil) || (params[:country] == '' && params[:category] == '')
      query["country"] = Geocoder.search(remote_ip).first.country_code
      query["category"] = "general"
    else
      query["country"] = params[:country]
      query["category"] = params[:category]
    end

    query["apiKey"] = Rails.application.credentials.dig(:newsapi, :apiKey)

    uri.query = Rack::Utils.build_query(query)
    optUrl = uri.to_s

    req = URI.open(optUrl)
    response_body = req.read
    data = JSON.parse(response_body)

    data["articles"].each do |item|
    puts(params[:country])
      if Article.where(author: item["author"],
        title: item["title"],
        description: item["description"]).empty? && Blacklist.where( title: item["title"],description: item["description"],summary:item["content"]).empty?
      Article.create(
        country: query["country"],
        category: query["category"],
        source: item["source"]["name"],
        author: item["author"],
        title: item["title"],
        description: item["description"],
        summary: item["content"],
        link: item["url"],
        media: item["urlToImage"],
        publication: item["publishedAt"]
      )
    end
  end
  if current_user
    followee = Follow.where(follower_id: current_user.id).pluck(:followee_id)
    else
    followee = User.all.pluck(:id)
    end
  if params[:country] == nil && params[:category] == nil
    @feeds = Forecast.all.reverse() + (
      Post.where(user_id: followee).reverse() + 
      Playlist.where(country: nil) + 
      Article.where(category: "general").reverse()
    ).shuffle()
    else
      if params[:country] == nil && params[:category] != nil
       @feeds = Forecast.all.reverse() + (
        Post.where(user_id: followee).reverse() + 
        Playlist.all + 
        Article.where(category: query["category"]).reverse()
      ).shuffle()
      else
        if params[:country] != nil && params[:category] == nil
          @feeds = Forecast.all.reverse() + (
            Post.where(user_id: followee).reverse() + 
            Playlist.where(country: query["country"])+ 
            Article.where(country: query["country"]).reverse()
          ).shuffle()
      else
        if params[:country] != nil && params[:category] != nil
          @feeds = Forecast.all.reverse() + (
            Post.where(user_id: followee).reverse() + 
            Playlist.where(country: query["country"])+ 
            Article.where(country: query["country"],category: query["category"]).reverse()
          ).shuffle()
        end 
      end
    end
  end
  end
end

  # GET /feeds/1 or /feeds/1.json
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds or /feeds.json
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to feed_url(@feed), notice: "Feed was successfully created." }
        format.json { render :show, status: :created, location: @feed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds/1 or /feeds/1.json
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to feed_url(@feed), notice: "Feed was successfully updated." }
        format.json { render :show, status: :ok, location: @feed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds/1 or /feeds/1.json
  def destroy
    @feed.destroy

    respond_to do |format|
      format.html { redirect_to feeds_url, notice: "Feed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feed_params
      params.fetch(:feed, {}).permit(:article_id, :forecast_id, :post_id)
    end
end
