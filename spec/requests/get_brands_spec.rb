require 'rails_helper'

describe "get all brands route", :type => :request do
    before do
        Brand.destroy_all
        brand = Brand.create(name: "Polo")
        get "/brands" 
    end

    it "should return all brands" do
        expect(JSON.parse(response.body).size).to(eq(1))
    end

    it "should return status code of 200" do
        expect(response).to have_http_status(200)
    end
end