require 'http'
require 'json'

module ElevatorMedia
    class Streamer
        def self.get_content(param)
            if param == "weather"
                get_weather
            elsif param == "pokemon"
                get_pokemon
            end
        end

        def self.get_weather
            uri = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=Montreal,CA&appid=1bb09a963096cd5c59b74b7fa6336772&units=metric")
            obj = JSON.parse(uri)['main']['temp']
            content = "The temperature in Montreal is #{obj}C."
            return content
        end

        def self.get_pokemon()
            id = rand(897)
            uri = HTTP.get("https://pokeapi.co/api/v2/pokemon-form/#{id}")
            obj = JSON.parse(uri)['sprites']['front_shiny']
            content = %[<img src="#{obj}" alt = "random pokemon" style="width:400px; height:400px">]
            return content           
        end
    end
end