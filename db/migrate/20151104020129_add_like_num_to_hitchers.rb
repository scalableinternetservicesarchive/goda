class AddLikeNumToHitchers < ActiveRecord::Migration
  def change
    add_column :hitchers, :like_num, :integer, default: 0
  end
end
