class AddLeftToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :left, :integer
  end
end
