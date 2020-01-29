class CreateMovementInjuries < ActiveRecord::Migration[6.0]
  def change
    create_table :movement_injuries do |t|
      t.references :movement, null: false, foreign_key: true
      t.references :injury, null: false, foreign_key: true

      t.timestamps
    end
  end
end
