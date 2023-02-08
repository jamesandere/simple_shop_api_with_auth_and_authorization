require 'rails_helper'

describe "get all products route", :type => :request do

    before do
        brand = Brand.create(name: "Polo")
        product = Product.create(name: "Polo shirt", price: 100.00, brand_id: brand.id)
         get "/brands/#{brand.id}/products" 
         brand.destroy
    end     

    it "should return all products" do
        expect(JSON.parse(response.body).size).to(eq(1))
    end

    it "should return status code 200" do
        expect(response).to have_http_status(200)
    end
end