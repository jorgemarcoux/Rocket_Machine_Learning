require 'spec_helper'
require 'rails_helper'
describe Address, type: :model do
	let(:address) { Address.new }
	context "test if Address model exist" do
		it "return if Address exist" do
			expect(address).to be_valid
		end
	end
	context "Address street attributes exist" do
		it "return false if not" do
			address.should respond_to(:number_and_street, :city, :country, :postal_code)
		end
	end
end