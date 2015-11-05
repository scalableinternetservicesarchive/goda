class AddDriverLikeNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :driver_like_num, :integer, default: 0
  end
end
