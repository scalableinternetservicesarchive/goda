class CreateHitcherLikes < ActiveRecord::Migration
  def change
    create_table :hitcher_likes do |t|
      t.integer :hitcher_id
      t.integer :user_id
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
