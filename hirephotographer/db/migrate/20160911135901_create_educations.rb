class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :degree
      t.date :startDate
      t.date :endDate
      t.date :graduatedate
      t.string :school
      t.string :major
      t.string :result
      t.string :remark
      t.belongs_to :profile, index: true, foreign_key: true
      t.timestamps
    end
  end
end
