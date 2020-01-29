class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.string :description
      t.string :skill_level
      t.string :category
      t.integer :scale_option_id
      t.string :muscle_group
      t.string :avoid_if_injured

      t.timestamps
    end
  end
end
