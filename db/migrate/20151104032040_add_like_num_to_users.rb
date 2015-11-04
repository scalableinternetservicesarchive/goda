class AddLikeNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :like_num, :integer, default: 0
  end
end
