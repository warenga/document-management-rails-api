class User < ApplicationRecord
  # model association
  has_many :documents, dependent: :destroy

  # validations
  validates_presence_of :username, :email
end
