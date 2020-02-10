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

    def athlete_workouts
      athlete = Athlete.find(params[:id])
      if athlete.workouts
        render json: athlete.workouts
      else 
        render json: { error: "No Workouts" }, status: 404
      end
  end

    def create
        coach = Coach.create(user_params)
        if coach.valid?
          render json: coach
        else
          render json: {message: coach.errors.full_messages[0]}, status: :not_acceptable
        end 
    end

    def athletes
        if @current_user.athletes
          render json: @current_user.athletes
        else 
          render json: { error: "No Athletes" }, status: 404
        end
    end

    def find_athlete
      athlete = Athlete.find_by(email: params[:athlete_email])
      coach = Coach.find(params[:id])
      if athlete
        athlete.update(coach_id: coach.id)
        render json: athlete
      else
        render json: {message: "Athlete not found. Please try again"}, status: 404
      end
      
    end




    def user_params
        params.require(:coach).permit(:email, :password, :first_name, :last_name)
    end
end
