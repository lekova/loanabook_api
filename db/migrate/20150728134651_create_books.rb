class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :owner_id, index: true
      t.string :title, null: false
      t.string :author, null: false
      t.integer :year
      t.decimal :price
      t.text :url
      t.integer :status
      t.foreign_key :users, :column => :owner_id, :dependent => :delete

      t.timestamps null: false
    end
  end
end
