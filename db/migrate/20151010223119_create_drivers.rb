class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :departure
      t.string :destination
      t.decimal :price
      t.string :depart_time
      t.string :estimated_arrival_time
      t.text :description
      t.string :car_type
      t.integer :passenger_num
      t.string :contact_info

      t.timestamps null: false
    end
  end
end
