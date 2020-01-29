class CreateHealthData < ActiveRecord::Migration[6.0]
  def change
    create_table :health_data do |t|

      t.timestamps
    end
  end
end
