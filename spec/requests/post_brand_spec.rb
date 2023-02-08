require 'rails_helper'

describe "post a brand route" do
    before do
        post "/brands", params: {name: "Polo"}
    end

    it "should return product name" do
        expect(JSON.parse(response.body)['name']).to(eq("Polo"))
    end

    it "returns a created status" do
        expect(response).to have_http_status(:created)
    end
end