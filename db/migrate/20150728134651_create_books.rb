class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.references :user, column: :owner_id, index: true, foreign_key: true, on_delete: :cascade
      t.string :title, null: false
      t.string :author, null: false
      t.integer :year
      t.decimal :price
      t.text :url

      t.timestamps null: false
    end
  end
end
