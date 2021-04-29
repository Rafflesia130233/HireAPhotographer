class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :givenby
      t.string :givento
      t.integer :customer_user
      t.integer :photographer_user
      t.string :parentfeedback
      t.string :comment
      t.string :feedback
      t.date :givenat
      t.belongs_to :profile, index: true, foreign_key: true
      t.belongs_to :experience, index: true, foreign_key: true
      t.timestamps
    end
  end
end
