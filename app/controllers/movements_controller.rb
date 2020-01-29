class MovementsController < ApplicationController
  def index
    movements = Movement.all
    render json: movements 
  end

  def show
    movement = Movement.find(params[:id])
    render json: movement
  end
end
