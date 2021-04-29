class Profile < ApplicationRecord
  has_many :experiences, dependent: :destroy, foreign_key: 'profile_id'
  has_many :photos,dependent: :destroy, foreign_key: 'profile_id'
  has_many :trainings,dependent: :destroy, foreign_key: 'profile_id'
  has_many :certifications,dependent: :destroy, foreign_key: 'profile_id'
  has_many :feedbacks, :through => :experiences, dependent: :destroy, foreign_key: 'profile_id'
  has_many :comments, :through => :feedbacks, dependent: :destroy, foreign_key: 'profile_id'
  has_many :educations,dependent: :destroy, foreign_key: 'profile_id'
  belongs_to :user, :class_name => 'User', autosave: true
end
