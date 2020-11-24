require 'http'
require 'json'

module ElevatorMedia
    class Streamer
        def self.getContent(param)
            if param == "weather"
                uri = HTTP.get('http://api.openweathermap.org/data/2.5/weather?q=Montreal,CA&appid=1bb09a963096cd5c59b74b7fa6336772&units=metric')
                obj = JSON.parse(uri)['main']['temp']
                weather = "The temperature in montreal is #{obj}C."
                puts weather
                return weather
            elsif param == "pokemon"
                id = rand(400)
                uri = HTTP.get("https://pokeapi.co/api/v2/pokemon-form/#{id}/")
                obj = JSON.parse(uri)['sprites']['front_default']
                puts "Here's your awesome pokemon : #{obj}"
                content = %[<img src="#{obj}" alt = "random pokemon" style="width:400px; height:400px">]
                return content
            end
        end
    end
end