class CreateProfilepictures < ActiveRecord::Migration[5.0]
  def change
    create_table :profilepictures do |t|
      t.belongs_to :personalinformations, index: true, foreign_key: true
      t.attachment :avatar
      t.timestamps
    end
  end
end
