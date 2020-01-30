class CreateAffiliates < ActiveRecord::Migration[6.0]
  def change
    create_table :affiliates do |t|
      t.string :name
      t.string :email
      t.string :location
      t.string :password_digest
      t.string :account_type, :null => false, :default => 'affiliate'

      t.timestamps
    end
  end
end
