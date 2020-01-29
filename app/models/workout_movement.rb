class WorkoutMovement < ApplicationRecord
  belongs_to :workout
  belongs_to :movement
end
