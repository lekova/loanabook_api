class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, column: :sender_id, index: true, foreign_key: true, on_delete: :cascade
      t.references :conversation, column: :conversation_id, index: true, foreign_key: true, on_delete: :cascade

      t.text :text
      t.date :date

      t.timestamps null: false
    end
  end
end
