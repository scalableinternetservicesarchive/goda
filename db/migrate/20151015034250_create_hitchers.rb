class CreateHitchers < ActiveRecord::Migration
  def change
    create_table :hitchers do |t|
      t.string :departure
      t.string :destination
      t.string :depart_time
      t.string :arrival_time
      t.text :description
      t.integer :num
      t.string :contact_info

      t.timestamps null: false
    end
  end
end
