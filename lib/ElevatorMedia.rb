require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'


module ElevatorMedia
    class Streamer
        def API(input)
            url = URI("https://covid-193.p.rapidapi.com/countries")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request["x-rapidapi-key"] = '536c73f8cbmshc86d9d7ab5827f0p1b5db6jsn773cfc9d241f'
            request["x-rapidapi-host"] = 'covid-193.p.rapidapi.com'

            response = http.request(request)
            json_response = JSON.parse(response.body)
        end
    end  
end

