class CreateDrivercomments < ActiveRecord::Migration
  def change
    create_table :drivercomments do |t|
      t.string :commenter
      t.text :body
      t.references :driver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
