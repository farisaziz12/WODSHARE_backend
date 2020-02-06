class Workout < ApplicationRecord
    has_many :workout_movements, dependent: :destroy
    has_many :movements, through: :workout_movements, dependent: :destroy
    belongs_to :athlete, optional: true
    belongs_to :coach, optional: true
    belongs_to :affiliate, optional: true
    
end
