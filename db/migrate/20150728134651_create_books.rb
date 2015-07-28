class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.decimal :price
      t.text :url

      t.timestamps null: false
    end
  end
end
