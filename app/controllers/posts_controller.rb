class PostsController < ApplicationController
    skip_before_action :authorized, only: [:post_tags, :show, :index]

    def index
        @author = Author.find(params[:author_id])
        @posts = @author.posts
        json_response(@posts)
    end

    def create
        @author = Author.find(params[:author_id])
        @post = @author.posts.new(post_params)
        if @post.save
            json_response(@post, :created)
        end
    end

    def show
        @post = Post.find(params[:id])
        json_response(@post)
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render status: 200, json: {
                message: 'Updated post successfully'
            }
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    end

    def post_tags
        @post = Post.find(params[:id])
        @categories = @post.categories
        json_response(@categories)
    end

    private
    def post_params
        params.permit(:title, :description)
    end
end