require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'

module ElevatorMedia
    class Streamer
        def initialize
            @montreal_weather = {}
            @pokemon = {}
            @random = {}
        end

        def get_content(param)
            if param == "weather"
                get_weather
            elsif param == "pokemon"
                get_pokemon
            end
        end

        def get_weather_connection(city)
            url = URI("https://community-open-weather-map.p.rapidapi.com/weather?q=#{city}%2Cca&units=metric")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = '536c73f8cbmshc86d9d7ab5827f0p1b5db6jsn773cfc9d241f'
            request["x-rapidapi-host"] = 'community-open-weather-map.p.rapidapi.com'

            response = http.request(request)
            json_response = JSON.parse(response.body)

            if response.code == "200"
                content = json_response
            else
                content = "Bad Request"
            end
            content
        end

        def get_weather
            @montreal_statistics = self.get_weather_connection('Montreal')
            content = "<h2 style=\"color:darkblue\">The weather in Montreal is #{@montreal_statistics['main']['temp']}C</h2>"
            puts content
            return content
        end

        def get_pokemon_connection(amount)
            id = rand(amount)
            uri = HTTP.get("https://pokeapi.co/api/v2/pokemon-form/#{amount}")
            if uri.code == 200
                content = JSON.parse(uri)
            else
                content = "Bad Request"
            end
            content         
        end
        def pokemon_random
            rand(897)
        end
        def get_pokemon
            @random = pokemon_random
            @pokemon = self.get_pokemon_connection(@random)
            content = "<img width='300' height='300' src='#{@pokemon['sprites']['front_default']}'>"
            puts content
            return content
        end
    end
end