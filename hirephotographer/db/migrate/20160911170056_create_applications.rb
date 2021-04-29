class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.belongs_to :photographer_user, index: true, foreign_key: true
      t.belongs_to :job_detail, index: true, foreign_key: true
      t.belongs_to :hire_detail, index: true, foreign_key: true
      t.date :submitted
      t.date :created
      t.string  :status
      t.string  :hirestatus
      t.string :hireDetail_id
      t.timestamps
    end
  end
end
