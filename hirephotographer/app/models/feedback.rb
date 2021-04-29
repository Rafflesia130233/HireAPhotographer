class Feedback < ApplicationRecord
  belongs_to :photographer_user, :class_name => 'Photographer::User'
  belongs_to :customer_user, :class_name => 'Customer::User'
  has_many :comments
end
