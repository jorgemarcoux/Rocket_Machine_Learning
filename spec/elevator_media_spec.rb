require 'ElevatorMedia'

describe 'Streamer' do 
  describe 'getContent' do
    context "GET /weather ?" do
      it 'return the weather in Montreal' do        
        expect(ElevatorMedia::Streamer.getContent("weather")).to be_kind_of(String)
      end
    end
    context "Get a random pokemon image" do
      it 'wich pokemon did you get?' do
      end
    end
  end            
end
