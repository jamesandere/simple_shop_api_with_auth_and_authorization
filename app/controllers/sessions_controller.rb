class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            @token = encode_token({user_id: @user.id})
            render status: :accepted, json: {
                message: "Logged in successfully",
                jwt: @token
            }
        else
            render status: :unauthorized, json: {
                message: 'Invalid username or password',
            }    
        end
    end

    def destroy
        session[:user_id] = nil
    end
end