require 'rails_helper'

describe "post a product route", :type => :request do
    before do
        brand = Brand.create(name: "Polo")
        post "/brands/#{brand.id}/products", params: { :name => 'TCL Roku', :price => 134.00 }
    end

    it "returns product name" do
        expect(JSON.parse(response.body)['name']).to eq('TCL Roku')
    end

    it "returns product price" do
        expect(JSON.parse(response.body)['price']).to eq(134.00)
    end

    it "returns a created status" do
        expect(response).to have_http_status(:created)
    end
end