class Comment < ApplicationRecord
  belongs_to :feedback
  belongs_to :profile
  belongs_to :customer_user, :class_name => 'Customer::User'
end
