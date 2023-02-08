class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        @users = User.all
        json_response(@users)
    end

    def create
        @user = User.create!(user_params)
        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render status: 201, json: {
                message: 'User created successfully',
                jwt: @token
            }
        else
            render json: {
                message: 'Failed to create user',
            }    
        end
    end

    private
    def user_params
        params.permit(:username, :email, :password, :password_confirmation)
    end
end