require 'ElevatorMedia'

describe 'Streamer' do 
  describe 'get_content' do
    context "whats is the weather in Montreal? ?" do
      it 'return the weather in Montreal' do        
        expect(ElevatorMedia::Streamer.get_content("weather")).to be_kind_of(String)
      end
    end
    context "Get a random pokemon image" do
      it 'GOTTA CATCH THEM ALL' do
        expect(ElevatorMedia::Streamer.get_content("pokemon")).to be_an_instance_of(String)
      end
    end
  end
end
