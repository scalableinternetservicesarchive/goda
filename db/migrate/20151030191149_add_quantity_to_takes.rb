class AddQuantityToTakes < ActiveRecord::Migration
  def change
    add_column :takes, :quantity, :integer
  end
end
