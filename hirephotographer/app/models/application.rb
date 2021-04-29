class Application < ApplicationRecord
  belongs_to :user, autosave: true
  belongs_to :job_detail, autosave: true
  belongs_to :hire_detail, optional:true
end
