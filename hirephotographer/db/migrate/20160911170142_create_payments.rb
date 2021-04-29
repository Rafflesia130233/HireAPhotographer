class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.belongs_to :customer_user, index: true, foreign_key: true
      t.belongs_to :job_detail, index: true, foreign_key: true
      t.belongs_to :hire_detail, index: true, foreign_key: true
      t.belongs_to :photographer_user, index: true, foreign_key: true
      t.date :date
      t.float :amount
      t.string :status
      t.string :remark
      t.string :paymentmethod
      t.timestamps
    end
  end
end
