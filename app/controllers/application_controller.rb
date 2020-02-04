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
            if decoded_token["account_type"] == "athlete"
                @current_user = Athlete.find(decoded_token["athlete_id"])
            elsif decoded_token["account_type"] == "coach"
                @current_user = Coach.find(decoded_token["athlete_id"])
            end
        else 
            @current_user = nil
        end
    end

    def logged_in?
        !!@current_user
    end
end
