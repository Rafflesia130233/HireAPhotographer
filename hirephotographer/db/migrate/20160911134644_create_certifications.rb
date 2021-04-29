class CreateCertifications < ActiveRecord::Migration[5.0]
  def change
    create_table :certifications do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.date :validTill
      t.string :organization
      t.string :description
      t.string :result
      t.string :remark
      t.belongs_to :profile, index: true, foreign_key: true
      t.timestamps
    end
  end
end
