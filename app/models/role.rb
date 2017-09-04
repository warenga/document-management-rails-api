class Role < ApplicationRecord
  # validations
  validates_presence_of :title
end
