class AddUseridToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :userid, :integer
  end
end
