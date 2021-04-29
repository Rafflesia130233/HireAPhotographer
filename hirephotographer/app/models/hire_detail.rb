class HireDetail < ApplicationRecord
  belongs_to :job_detail

  has_many :payments, foreign_key: 'hire_detail_id'
  has_one :application, foreign_key: 'hire_detail_id'
end
