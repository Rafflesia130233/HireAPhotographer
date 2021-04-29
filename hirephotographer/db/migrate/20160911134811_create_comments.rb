class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comment
      t.string :feedback
      t.string :commentby
      t.string :commentat
      t.belongs_to :profile, index: true, foreign_key: true
      t.belongs_to :feedback, index: true, foreign_key: true
      t.timestamps
    end
  end
end
