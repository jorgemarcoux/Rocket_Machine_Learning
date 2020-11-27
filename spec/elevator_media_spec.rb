require 'ElevatorMedia'


RSpec.describe ElevatorMedia::Streamer do 
  let(:streamer) { described_class.new }
  describe "get_weather_connection" do

    context 'GET request verification' do
      it 'should return a json' do
         expect(streamer.get_weather_connection('Montreal')).to be_a(Hash)
      end
    end

    context 'GET a bad request' do
      it 'return a message for a bad request' do
        expect(streamer.get_weather_connection("Montral")).to eq('Bad Request')
      end
    end
  end

  describe 'get_weather' do

    context 'STUB get_weather_connection method ' do

      it 'returns a predefined Hash' do
         allow(streamer).to receive('get_weather_connection').with('Montreal').and_return(
          {"coord"=>{"lon"=>-73.59, "lat"=>45.51}, "weather"=>[{"id"=>804, "main"=>"Clouds", "description"=>"overcast clouds", "icon"=>"04n"}], "base"=>"stations", "main"=>{"temp"=>1.34, "feels_like"=>-1.49, "temp_min"=>0.56, "temp_max"=>2.22, "pressure"=>1015, "humidity"=>100, "sea_level"=>1015, "grnd_level"=>990}, "visibility"=>2010, "wind"=>{"speed"=>1.5, "deg"=>20}, "clouds"=>{"all"=>100}, "dt"=>1606438499, "sys"=>{"type"=>1, "id"=>498, "country"=>"CA", "sunrise"=>1606392532, "sunset"=>1606425313}, "timezone"=>-18000, "id"=>6077243, "name"=>"Montreal", "cod"=>200}
         )
         streamer.get_weather
         temperature = streamer.instance_variable_get('@montreal_statistics')
         expect(temperature["id"]).to eq(6077243)
      end
    end   
  end

  describe 'get_pokemon_connection' do
    
    context "Get a random pokemon image" do
      it 'GOTTA CATCH THEM ALL' do
        expect(streamer.get_pokemon_connection(2)).to be_kind_of(Hash)
      end
    end
    context 'Get a bad request' do
      it 'return a message for a bad request' do
        expect(streamer.get_pokemon_connection(2000)).to eq('Bad Request')
      end
    end
  end

  describe 'get_pokemon' do

    context 'put a STUB on get_pokemon_connection method ' do
      it 'returns a predefined Hash' do
         allow(streamer).to receive('get_pokemon_connection').with(2).and_return(
        {"form_name"=>"", "form_names"=>[], "form_order"=>1, "id"=>1, "is_battle_only"=>false, "is_default"=>true, "is_mega"=>false, "name"=>"bulbasaur", "names"=>[], "order"=>1, "pokemon"=>{"name"=>"bulbasaur", "url"=>"https://pokeapi.co/api/v2/pokemon/1/"}, "sprites"=>{"back_default"=>"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png", "back_shiny"=>"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png", "front_default"=>"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", "front_shiny"=>"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"}, "version_group"=>{"name"=>"red-blue", "url"=>"https://pokeapi.co/api/v2/version-group/1/"}}
         )
         streamer.stub(:pokemon_random).and_return(2)
         streamer.get_pokemon
         picture = streamer.instance_variable_get('@pokemon')
         expect(picture["sprites"]["front_default"]).to eq("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
      end
    end   
  end

  describe 'get_content' do

    context "GET the weather in Montreal" do
      it 'return the weather in Montreal' do        
        expect(streamer.get_content("weather").class.name).to eq("String")
      end
    end
    context "GET a random pokemon image" do
      it 'GOTTA CATCH THEM ALL' do
        expect(streamer.get_content("pokemon").class.name).to eq("String")
      end
    end
  end
end
