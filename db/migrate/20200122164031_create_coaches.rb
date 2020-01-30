class CreateCoaches < ActiveRecord::Migration[6.0]
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :account_type, :null => false, :default => 'coach'
      t.integer :affiliate_id

      t.timestamps
    end
  end
end
