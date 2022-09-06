json.extract! forecast, :id, :place, :lat, :lon, :weather, :description, :icon, :temp, :temp_min, :temp_max, :pressure, :humidity, :sea_level, :grnd_level, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)
