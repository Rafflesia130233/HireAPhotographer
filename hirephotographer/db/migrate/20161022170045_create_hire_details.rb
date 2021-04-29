class CreateHireDetails < ActiveRecord::Migration[5.0]
begin
  def change
    create_table :hire_details do |t|
      t.belongs_to :job_detail, index: true, foreign_key: true
      t.belongs_to :customer_user, index: true, foreign_key: true
      t.integer :applicant_id
      t.date :startdate
      t.float :salary
      t.string :details
      t. string :status
      t.timestamps
      t.belongs_to :photographer_user, index: true, foreign_key: true
    end
  end
end
end
