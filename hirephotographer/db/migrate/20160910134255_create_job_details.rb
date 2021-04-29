class CreateJobDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :job_details do |t|
      t.string :jobTitle
      t.date :validTill
      t.string :status
      t.string :hiredetail
      t.date :createdon
      t.integer :salary
      t.string :jobRequirementId
      t.string :type
      t.string :location
      t.date :startDate
      t.date :endDate
      t.float :min_salary
      t.float :max_salary
      t.integer :hours_per_week
      t.float :min_rate
      t.float :max_rate
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
