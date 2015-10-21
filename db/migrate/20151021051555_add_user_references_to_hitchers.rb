class AddUserReferencesToHitchers < ActiveRecord::Migration
  def change
    add_reference :hitchers, :user, index: true, foreign_key: true
  end
end
