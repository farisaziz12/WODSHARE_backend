class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.date :date_of_birth
      t.integer :deadlift
      t.integer :backsquat
      t.integer :strict_press
      t.integer :clean_and_jerk
      t.integer :snatch
      t.string :account_type, :null => false, :default => 'athlete'
      t.references :coach, foreign_key: true 
      t.references :affiliate, foreign_key: true

      t.timestamps
    end
  end
end
