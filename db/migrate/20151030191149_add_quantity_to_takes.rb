class AddQuantityToTakes < ActiveRecord::Migration
  def change
    add_column :takes, :quantity, :integer, default: 0
  end
end
