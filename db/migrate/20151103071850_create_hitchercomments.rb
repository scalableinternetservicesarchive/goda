class CreateHitchercomments < ActiveRecord::Migration
  def change
    create_table :hitchercomments do |t|
      t.string :commenter
      t.text :body
      t.references :hitcher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
