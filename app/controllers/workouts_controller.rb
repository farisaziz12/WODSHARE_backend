class WorkoutsController < ApplicationController
  
  def create
    workout = Workout.create(workout_params)
      if workout.valid?
        render json: workout
      else
        render json: {message: workout.errors.full_messages[0]}, status: :not_acceptable
      end 
  end

  def update
    workout = Workout.find(params[:id])
    workout.update(workout_params)
    if workout.valid?
      render json: workout
    else
      render json: {message: workout.errors.full_messages[0]}, status: :not_acceptable
    end 
  end

  def destroy
    workout = Workout.find(params[:id])
    workout.destroy
  end


  private

  def workout_params
    params.require(:workout).permit(:score, :name, :wod_type, :category, :workout, :coach_id, :athlete_id, :date)
  end

end
