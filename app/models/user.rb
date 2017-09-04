class User < ApplicationRecord
  # model association
  belongs_to :role
  has_many :documents, dependent: :destroy

  # validations
  validates_presence_of :username, :email
end
