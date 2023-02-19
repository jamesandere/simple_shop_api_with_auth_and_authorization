class ProductsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def index
        @brand = Brand.find(params[:brand_id])
        @products = @brand.products
        name = params[:name]
        if name
            @products = Product.search(name)
        end
        
        json_response(@products)
    end

    def show
        @product = Product.find(params[:id])
        json_response(@product)
    end

    def create
        @brand = Brand.find(params[:brand_id])
        @product = @brand.products.new(product_params)
        if @product.save
        json_response(@product, :created)
        end
    end

    def update
        @product = Product.find(params[:id])
        if @product.update!(product_params)
            render status: 200, json: {
                message: "This product has been updated successfully."
            }
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
    end

    private
    def product_params
        params.permit(:name, :price)
    end
end