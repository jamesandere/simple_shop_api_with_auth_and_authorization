class ApplicationController < ActionController::API
    include Response
    before_action :authorized

    def auth_header
        request.headers['Authorization']
    end

    def encode_token(payload)
        JWT.encode(payload, 'secret')
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil    
            end    
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        unless logged_in?
            render json: { message: 'Please log in' }, status: :unauthorized
        end
    end

rescue_from ActiveRecord::RecordNotFound do |exception|
    json_response({ message: exception.message }, :not_found )
end

rescue_from ActiveRecord::RecordInvalid do |exception|
    json_response({ message: exception.message }, 422)
end

end
