class Workout < ApplicationRecord
    has_many :workout_movements
    has_many :movements, through: :workout_movements
    belongs_to :athlete, optional: true
    belongs_to :coach, optional: true
    belongs_to :affiliate, optional: true
end
