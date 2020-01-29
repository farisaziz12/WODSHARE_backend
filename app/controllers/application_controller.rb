class ApplicationController < ActionController::API
    before_action :set_current_user
    
    def issue_token(payload)
        JWT.encode(payload, ENV['NUTRI'])
    end

    def decode_token(token)
        JWT.decode(token, ENV['NUTRI'])[0]
    end

    def get_token
        request.headers["Authorization"] || request.headers["Authorisation"]
    end

    def set_current_user
        token = get_token
        if token
            decoded_token = decode_token(token)
            @current_user = Athlete.find(decoded_token["athlete_id"])
        else 
            @current_user = nil
        end
    end

    def logged_in?
        !!@current_user
    end
end
