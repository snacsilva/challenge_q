class CreateLeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :leaders do |t|
      t.integer :employee_id
      t.integer :led_id

      t.timestamps
    end
  end
end
