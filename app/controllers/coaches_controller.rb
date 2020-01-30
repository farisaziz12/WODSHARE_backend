class CoachesController < ApplicationController
    def login
        coach = Coach.find_by(email: params[:email])
        if coach && coach.authenticate(params[:password])
          render json: coach

          { token: issue_token({ id: coach.id, account_type: coach.account_type }), coach: coach }
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

    def create
        coach = Coach.create(user_params)
        if coach.valid?
          render json: coach
        else
            byebug
          render json: {message: coach.errors.full_messages[0]}, status: :not_acceptable
        end 
    end


    def user_params
        params.require(:coach).permit(:email, :password, :first_name, :last_name)
    end
end
