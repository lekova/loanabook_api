class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_one
      t.integer :user_two

      t.timestamps null: false
    end
  end
end
