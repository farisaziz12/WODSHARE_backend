class Movement < ApplicationRecord
    has_many :workout_movements, dependent: :destroy
    has_many :workouts, through: :workout_movements, dependent: :destroy
    belongs_to :scale_option_id, :class_name => "Movement",
    :foreign_key => "scale_option_id"
end
