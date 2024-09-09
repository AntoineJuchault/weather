require "net/http"
require "json"
require "uri"

# Variables pour lon et lat
lat = 48.9065
lon = 2.3334

# URL de l'API Open-Meteo avec lon et lat
url = "https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{lon}&current=temperature_2m,relative_humidity_2m,precipitation,rain,cloud_cover,wind_speed_10m,wind_direction_10m,wind_gusts_10m"

# Effectuer la requête HTTP
uri = URI(url)
response = Net::HTTP.get(uri)

# Parse de la réponse JSON
weather_data = JSON.parse(response)

# Vérification de la présence des données météorologiques
current_weather = weather_data["current"]

# Affichage des données météorologiques générales
puts "Température : #{current_weather["temperature_2m"]}°C"
puts "Humidité : #{current_weather["relative_humidity_2m"]}%"
puts "Pluie : #{current_weather["rain"]}mm"
puts "Précipitation : #{current_weather["precipitation"]}mm"
puts "Couverture nuageuse : #{current_weather["cloud_cover"]}%"
puts "Vitesse du vent :#{current_weather["wind_speed_10m"]}K/M"
puts "Direction du vent: #{current_weather["wind_direction_10m"]}°"
puts "Rafales de vent : #{current_weather["wind_gusts_10m"]}KM/H"


