class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :wod_type
      t.string :category
      t.string :score
      t.date :date
      t.string :rep_scheme
      t.string :workout
      t.references :coach, foreign_key: true
      t.references :athlete, foreign_key: true
      t.references :affiliate, foreign_key: true

      t.timestamps
    end
  end
end
