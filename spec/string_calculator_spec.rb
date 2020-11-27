# require 'string_calculator'

# describe StringCalculator do
#     describe ".add" do
#         context 'test for an empty string' do
#             it 'returns zero' do
#                 expect(StringCalculator.add("")).to eq({size: 0, value:nil})
#             end
#         end
#         context 'test for a string' do
#             it 'returns 4' do
#                 expect(StringCalculator.add("2345")).to eq({size: 4, value:"2345"})
#             end
#         end
#         context 'test for a string with stripped cars' do
#             it 'returns 4' do
#                 expect(StringCalculator.add("2A45")).to eq({size: 3, value:"245"})
#             end
#         end
#     end
# end