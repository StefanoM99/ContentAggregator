class ForecastsController < ApplicationController
  before_action :set_forecast, only: %i[ show edit update destroy ]

  # GET /forecasts or /forecasts.json
  def index
    Forecast.delete_all
    ActiveRecord::Base.connection.execute(
      "DELETE from sqlite_sequence where name = 'forecasts'"
    )

    require 'open-uri'
    
    url = 'http://api.openweathermap.org/geo/1.0/direct'
    uri = URI.parse(url)
    query = Rack::Utils.parse_query(uri.query)

    if params[:place] == nil || params[:place] == ''
      query["q"] = "Washington"
    else
      query["q"] = params[:place]
    end
    
    query["limit"] = "5"

    query["appid"] = Rails.application.credentials.dig(:openweather, :apiKey)

    uri.query = Rack::Utils.build_query(query)
    optUrl = uri.to_s

    req = URI.open(optUrl)
    response_body = req.read
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

    @forecasts = Forecast.all.reverse()
  end

  # GET /forecasts/1 or /forecasts/1.json
  def show
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # GET /forecasts/1/edit
  def edit
  end

  # POST /forecasts or /forecasts.json
  def create
    @forecast = Forecast.new(forecast_params)

    respond_to do |format|
      if @forecast.save
        format.html { redirect_to forecast_url(@forecast), notice: "Forecast was successfully created." }
        format.json { render :show, status: :created, location: @forecast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forecasts/1 or /forecasts/1.json
  def update
    respond_to do |format|
      if @forecast.update(forecast_params)
        format.html { redirect_to forecast_url(@forecast), notice: "Forecast was successfully updated." }
        format.json { render :show, status: :ok, location: @forecast }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forecasts/1 or /forecasts/1.json
  def destroy
    @forecast.destroy

    respond_to do |format|
      format.html { redirect_to forecasts_url, notice: "Forecast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = Forecast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forecast_params
      params.require(:forecast).permit(:place, :lat, :lon, :weather, :description, :icon, :temp, :temp_min, :temp_max, :pressure, :humidity, :sea_level, :grnd_level)
    end
end
