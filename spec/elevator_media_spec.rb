require 'ElevatorMedia'

describe 'Streamer' do 
  describe 'getContent' do
    context "whats is the weather in Montreal? ?" do
      it 'return the weather in Montreal' do        
        expect(ElevatorMedia::Streamer.getContent("weather")).to be_kind_of(String)
      end
    end
    context "Get a random pokemon image" do
      it 'GOTTA CATCH THEM ALL' do
        expect(ElevatorMedia::Streamer.getContent("pokemon")).to be_an_instance_of(String)
      end
    end
  end            
end
