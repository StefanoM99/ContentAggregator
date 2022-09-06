require "application_system_test_case"

class ForecastsTest < ApplicationSystemTestCase
  setup do
    @forecast = forecasts(:one)
  end

  test "visiting the index" do
    visit forecasts_url
    assert_selector "h1", text: "Forecasts"
  end

  test "should create forecast" do
    visit forecasts_url
    click_on "New forecast"

    fill_in "Description", with: @forecast.description
    fill_in "Grnd level", with: @forecast.grnd_level
    fill_in "Humidity", with: @forecast.humidity
    fill_in "Icon", with: @forecast.icon
    fill_in "Lat", with: @forecast.lat
    fill_in "Lon", with: @forecast.lon
    fill_in "Place", with: @forecast.place
    fill_in "Pressure", with: @forecast.pressure
    fill_in "Sea level", with: @forecast.sea_level
    fill_in "Temp", with: @forecast.temp
    fill_in "Temp max", with: @forecast.temp_max
    fill_in "Temp min", with: @forecast.temp_min
    fill_in "Weather", with: @forecast.weather
    click_on "Create Forecast"

    assert_text "Forecast was successfully created"
    click_on "Back"
  end

  test "should update Forecast" do
    visit forecast_url(@forecast)
    click_on "Edit this forecast", match: :first

    fill_in "Description", with: @forecast.description
    fill_in "Grnd level", with: @forecast.grnd_level
    fill_in "Humidity", with: @forecast.humidity
    fill_in "Icon", with: @forecast.icon
    fill_in "Lat", with: @forecast.lat
    fill_in "Lon", with: @forecast.lon
    fill_in "Place", with: @forecast.place
    fill_in "Pressure", with: @forecast.pressure
    fill_in "Sea level", with: @forecast.sea_level
    fill_in "Temp", with: @forecast.temp
    fill_in "Temp max", with: @forecast.temp_max
    fill_in "Temp min", with: @forecast.temp_min
    fill_in "Weather", with: @forecast.weather
    click_on "Update Forecast"

    assert_text "Forecast was successfully updated"
    click_on "Back"
  end

  test "should destroy Forecast" do
    visit forecast_url(@forecast)
    click_on "Destroy this forecast", match: :first

    assert_text "Forecast was successfully destroyed"
  end
end
