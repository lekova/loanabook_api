class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :loaner, null: false
      t.references :borrower, null: false
      t.references :book, index: true, null: false
      t.string :date_loaned, null: false
      t.integer :loan_duration

      t.timestamps null: false
    end

    add_index :loans, :loaner_id
    add_index :loans, :borrower_id
    add_foreign_key :loans, :users, column: :loaner_id, on_delete: :cascade
    add_foreign_key :loans, :users, column: :borrower_id, on_delete: :cascade
    add_foreign_key :loans, :books, on_delete: :cascade
  end
end
