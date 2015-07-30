class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :loaner_id
      t.integer :borrower_id
      t.string :date_loaned
      t.integer :loan_duration

      t.timestamps null: false
    end

    add_index :loans, :loaner_id
    add_index :loans, :borrower_id
  end
end
