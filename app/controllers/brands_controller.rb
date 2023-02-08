class BrandsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @brands = Brand.all
        json_response(@brands)
    end

    def create
        @brand = Brand.create!(brand_params)
        json_response(@brand, :created)
    end

    def show
        @brand = Brand.find(params[:id])
        json_response(@brand)
    end

    def update
        @brand = Brand.find(params[:id])
        if @brand.update!(brand_params)
            render status: 200, json: {
                message: "brand updated successfully"
            }
        end
    end

    def destroy
        @brand = Brand.find(params[:id])
        @brand.destroy
    end

    private
    def brand_params
        params.permit(:name)
    end
end