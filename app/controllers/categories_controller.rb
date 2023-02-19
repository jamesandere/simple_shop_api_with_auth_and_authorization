class CategoriesController < ApplicationController
    skip_before_action :authorized, only: [:index]

    def index
        @categories = Category.all
        json_response(@categories)
    end

    def create
        @category = Category.create(category_params)
        json_response(@category, :created)
    end

    private
    def category_params
        params.permit(:name)
    end
end