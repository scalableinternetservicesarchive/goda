class CreateDriverLikes < ActiveRecord::Migration
  def change
    create_table :driver_likes do |t|
      t.integer :driver_id
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
