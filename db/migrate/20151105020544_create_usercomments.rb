class CreateUsercomments < ActiveRecord::Migration
  def change
    create_table :usercomments do |t|
      t.string :commenter
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end