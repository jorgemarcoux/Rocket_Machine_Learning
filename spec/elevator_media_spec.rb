require 'ElevatorMedia'

describe 'Streamer' do 
    describe 'getContent' do
        context "GET /weather ?" do
            it 'return the weather in Montreal' do        
                expect(ElevatorMedia::Streamer.getContent).to be_kind_of(String)
            end
        end
    end            
end
