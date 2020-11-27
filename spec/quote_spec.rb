require 'rails_helper'
require 'spec_helper'

RSpec.describe "QuotesController", :type => :controller do
    let!(:int){Quote.new}
    it "returns 200 when there is a successful HTTP response AND an quote object" do
        expect(@response.status).to eq(200)
    end
end