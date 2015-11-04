class AddLikeNumToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :like_num, :integer, default: 0
  end
end
