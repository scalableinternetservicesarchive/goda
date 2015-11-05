class AddHitcherLikeNumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hitcher_like_num, :integer, default: 0
  end
end
