class CreateWorkoutMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_movements do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
