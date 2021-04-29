class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      #t.belongs_to :sender, index: true, foreign_key: true
      #t.belongs_to :recipient, index: true, foreign_key: true
      t.timestamps
    end
    add_index :conversations, :sender_id
    add_index :conversations, :recipient_id
  end
end
