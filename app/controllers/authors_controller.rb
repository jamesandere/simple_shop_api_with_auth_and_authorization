class AuthorsController < ApplicationController
    skip_before_action :authorized, only: [:show, :index]

    def index
        @authors = Author.all
        json_response(@authors)
    end

    def create
        @author = Author.create(author_params)
        json_response(@author, :created)
    end

    def show
        @author = Author.find(params[:id])
        json_response(@author)
    end

    def update
        @author = Author.find(params[:id])
        if @author.update(author_params)
            render status: 200, json: {
                message: "Author updated successfully"
            }
        end
    end

    def destroy
        @author = Author.find(params[:id])
        @author.destroy
    end

    private
    def author_params
        params.permit(:name)
    end
end