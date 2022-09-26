class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  # GET /playlists or /playlists.json
  def index
    Playlist.delete_all
    ActiveRecord::Base.connection.execute(
      "DELETE from sqlite_sequence where name = 'playlists'"
    )

    require 'open-uri'
    require 'oauth2'

    #url = 'https://api.spotify.com/v1/browse/featured-playlists'
    #uri = URI.parse(url)
    #query = Rack::Utils.parse_query(uri.query)

  
    #query["country"] = 'US'

    #query["access_token"] = Rails.application.credentials.dig(:spotify, :apiKey)

    #uri.query = Rack::Utils.build_query(query)
    #optUrl = uri.to_s

    #req = URI.open(optUrl)
    
    #response_body = req.read
    #data = JSON.parse(response_body)

    client_id = ''
    client_secret = ''

    client = OAuth2::Client.new('client_id', 'client_secret', site: 'https://accounts.spotify.com/api/token')

    client.auth_code.authorize_url(redirect_uri: 'http://localhost:3000/oauth2/callback')

    token = client.auth_code.get_token('authorization_code_value',
      redirect_uri: 'http://localhost:3000/oauth2/callback',
      headers: {'Authorization' => 'Basic client_id:client:secret'}
    )

    response = token.get('https://api.spotify.com/v1/browse/featured-playlists',
      params: { 'country' => 'IT' },
      headers: {'Content-type': 'application/json'}
    )

    response.body
    data = response.parsed

    data["playlists"]["items"].each do |item|
      Playlist.create(
        country: query["country"],
        name: item["name"],
        description: item["description"],
        spotify_url: item["external_urls"]["spotify"],
        spotify_img: item["images"][0]["url"]
      )
    end

    @playlists = Playlist.all
  end

  # GET /playlists/1 or /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully created." }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy

    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name, :description, :spotify_url, :spotify_img)
    end
end
