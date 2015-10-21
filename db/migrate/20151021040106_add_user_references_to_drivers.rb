class AddUserReferencesToDrivers < ActiveRecord::Migration
  def change
    add_reference :drivers, :user, index: true, foreign_key: true
  end
end
