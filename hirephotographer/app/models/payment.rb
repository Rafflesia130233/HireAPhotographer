class Payment < ApplicationRecord
  belongs_to :hire_detail
  belongs_to :job_detail
  belongs_to :customer_user, :class_name => 'Customer::User'
  belongs_to :photographer_user, :class_name => 'Photographer::User'
end
