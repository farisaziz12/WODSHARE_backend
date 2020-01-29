class AthletesController < ApplicationController
    def login
        athlete = Athlete.find_by(email: params[:email])
        if athlete && athlete.authenticate(params[:password])
          render json: athlete

        #   { token: issue_token({ id: athlete.id }), athlete: athlete }
        else
          render json: { error: "Email/password combination is invalid." }, status: 401
        end
      end

      def validate
        if logged_in?
            render json: @current_user
        else
            render json: { errors: ["Not Logged in"] }, status: :not_acceptable
        end
    end

end
