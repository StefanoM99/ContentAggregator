require "test_helper"

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forecast = forecasts(:one)
  end

  test "should get index" do
    get forecasts_url
    assert_response :success
  end

  test "should get new" do
    get new_forecast_url
    assert_response :success
  end

  test "should create forecast" do
    assert_difference("Forecast.count") do
      post forecasts_url, params: { forecast: { description: @forecast.description, grnd_level: @forecast.grnd_level, humidity: @forecast.humidity, icon: @forecast.icon, lat: @forecast.lat, lon: @forecast.lon, place: @forecast.place, pressure: @forecast.pressure, sea_level: @forecast.sea_level, temp: @forecast.temp, temp_max: @forecast.temp_max, temp_min: @forecast.temp_min, weather: @forecast.weather } }
    end

    assert_redirected_to forecast_url(Forecast.last)
  end

  test "should show forecast" do
    get forecast_url(@forecast)
    assert_response :success
  end

  test "should get edit" do
    get edit_forecast_url(@forecast)
    assert_response :success
  end

  test "should update forecast" do
    patch forecast_url(@forecast), params: { forecast: { description: @forecast.description, grnd_level: @forecast.grnd_level, humidity: @forecast.humidity, icon: @forecast.icon, lat: @forecast.lat, lon: @forecast.lon, place: @forecast.place, pressure: @forecast.pressure, sea_level: @forecast.sea_level, temp: @forecast.temp, temp_max: @forecast.temp_max, temp_min: @forecast.temp_min, weather: @forecast.weather } }
    assert_redirected_to forecast_url(@forecast)
  end

  test "should destroy forecast" do
    assert_difference("Forecast.count", -1) do
      delete forecast_url(@forecast)
    end

    assert_redirected_to forecasts_url
  end
end
