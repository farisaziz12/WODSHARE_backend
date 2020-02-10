class AthletesController < ApplicationController
    def login
        athlete = Athlete.find_by(email: params[:email])
        if athlete && athlete.authenticate(params[:password])
          render json: athlete

          { token: issue_token({ id: athlete.id, account_type: athlete.account_type }), athlete: athlete }
        else
          render json: { error: "Email/password combination is invalid." }, status: 401
        end
      end

    def workouts
        if @current_user.workouts
          render json: @current_user.workouts
        else 
          render json: { error: "No Workouts" }, status: 404
        end
    end

    def validate
        if logged_in?
            render json: @current_user
        else
            render json: { errors: ["Not Logged in"] }, status: :not_acceptable
        end
    end

    def update
      athlete = Athlete.find(params[:id])
      athlete.update(user_params)
      if athlete.valid?
        render json: athlete
      else
        render json: {message: athlete.errors.full_messages[0]}, status: :not_acceptable
      end 
    end


    def create
      athlete = Athlete.create(user_params)
      if athlete.valid?
        render json: athlete
      else
        render json: {message: athlete.errors.full_messages[0]}, status: :not_acceptable
      end 
    end

    def find_coach
        coach = Coach.find_by(email: params[:coach_email])
        athlete = Athlete.find(params[:id])
        if coach
          athlete.update(coach_id: coach.id)
          render json: coach
        else
          render json: {message: "Coach not found. Please try again"}, status: 404
        end
        
    end

    def remove_coach
      athlete = Athlete.find(params[:id])
      athlete.update(coach_id: nil)
    end

    
    def destroy
      athlete = Athlete.find(params[:id])
      athlete.destroy
    end

    private

    def user_params
      params.require(:athlete).permit(:coach_email, :email, :password, :first_name, :last_name, :deadlift, :strict_press, :clean_and_jerk, :backsquat, :snatch)
    end

end
