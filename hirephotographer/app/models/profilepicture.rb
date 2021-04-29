class Profilepicture < ApplicationRecord
  belongs_to :personalinformation
  has_attached_file :avatar
  #validates_attachment_content_type :avatar, :content_type =>     ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  #validates_attachment_content_type :avatar, :content_type => [/\Aimage/, 'application/octet-stream']
  do_not_validate_attachment_file_type :avatar
end
