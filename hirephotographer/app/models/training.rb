class Training < ApplicationRecord
  belongs_to :profile, autosave: true
end
