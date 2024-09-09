require "net/http"
require "json"
require "date"
require "uri"

lat = 48.9065
lon = 2.3334


url = "https://api.open-meteo.com/v1/forecast?latitude=#{lat}&longitude=#{lon}&daily=precipitation_sum&timezone=Europe%2FParis"

uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

rainy_days = []
cleary_days = []

#tableau contenant les mois ( Change it as you want) 
formatted_month = ["Janvier", "Fevrier","Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"]

data["daily"]["precipitation_sum"].each_with_index do |precipitation, index|
  date = Date.today + index
  formatted_date = " #{date.day} #{formatted_month[date.month - 1]} #{date.year}"

  if precipitation > 0
    rainy_days << formatted_date
  else 
    cleary_days << formatted_date
  end
end

puts "Jours avec pluie : "
puts rainy_days.join("\n")

puts 
puts "Jours sans pluie :"
puts cleary_days.join("\n")

