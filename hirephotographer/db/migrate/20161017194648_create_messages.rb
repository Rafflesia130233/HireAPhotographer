class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :conversation, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.string :body
      t.timestamps
    end
  end
end
