class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.integer :user_id
      t.integer :hitcher_id

      t.timestamps null: false
    end
  end
end
