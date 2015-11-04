class AddUserIdToDriverLikes < ActiveRecord::Migration
  def change
    add_column :driver_likes, :user_id, :integer
  end
end
