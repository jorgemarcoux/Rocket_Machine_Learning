require 'http'

module ElevatorMedia
    class Streamer
        def self.getContent(param)
            if param == "weather"
                uri = HTTP.get('http://api.openweathermap.org/data/2.5/weather?q=Montreal,CA&appid=f2289bc932be7c633fdf061e35220125&units=metric')
                obj = JSON.parse(uri)['main']['temp']
                weather = "The weather is #{obj}C."
                puts weather
                return weather
            end
        end
    end
end