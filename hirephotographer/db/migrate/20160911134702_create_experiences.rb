class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :customername
      t.date :startDate
      t.date :endDate
      t.boolean :ongoing
      t.string :organizaion
      t.string :description
      t.string :role
      t.string :remark
      t.belongs_to :profile, index: true, foreign_key: true
      t.timestamps
    end
  end
end
