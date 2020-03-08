# encoding: utf-8
#
# Program 'Weather forecast'. Training project.
#
# Getting data from XML of meteoservice
# http://www.meteoservice.ru/content/export.html

# The following code is necessary to work with Russian symbols on Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Gem to work with addresses URI
require 'uri'
# Gem to download data by http
require 'net/http'
# Gem to parse XML
require 'rexml/document'
# Gem to work with Dates
require 'date'

# A list of the cities. Can be extended with the data from meteoservice
CITIES = {
  'Copenhagen': 302,
  'Murmansk': 113,
  'Cairo': 334,
  'Batumi': 2871,
  'Dubai': 333,
  'Belgrade': 281,
  'Vancouver': 10409
}

puts 'Please choose the number of city to receive the forecast'
CITIES.keys.each.with_index(1) { |city, index| puts "#{index}. #{city}" }

choice = STDIN.gets.to_i - 1

# Connecting to the website
url = URI.parse("https://xml.meteoservice.ru/export/gismeteo/point/#{CITIES[CITIES.keys[choice]]}.xml")
response = Net::HTTP.get_response(url)
doc = REXML::Document.new(response.body)
# ----------------------------

today = Date.today

# Printing the city name in Russian. Uncomment if necessary
# city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
# puts city_name

# Parsing xml
forecast = doc.root.elements['REPORT/TOWN']

forecast.elements.each do |element|
  date = "#{element.attributes['year']}-#{element.attributes['month']}-#{element.attributes['day']}"

  forecast_date =
    case Date.parse(date) - today
    when 1 then
      'Tomorrow'
    when 0 then
      'Today'
    else date
    end

  time_of_the_day =
    case element.attributes['tod']
    when '0' then
      'night'
    when '1' then
      'morning'
    when '2' then
      'day'
    else
      'evening'
    end

  min_temp = element.elements['TEMPERATURE'].attributes['min'].to_i
  max_temp = element.elements['TEMPERATURE'].attributes['max'].to_i

  wind = element.elements['WIND'].attributes['max']

  phenomena =
    case element.elements['PHENOMENA'].attributes['cloudiness']
      when '-1' then
        'fog'
      when '0' then
        'clear'
      when '1' then
        'mainly clear'
      when '2' then
        'cloudy'
      else
        'dull'
    end

  puts "#{forecast_date}, #{time_of_the_day}"
  puts "#{min_temp}..#{max_temp}, wind #{wind} meters per sec, #{phenomena}"
end
