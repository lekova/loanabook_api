class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.text :text
      t.date :date
      t.integer :conversation_id

      t.timestamps null: false
    end
  end
end
