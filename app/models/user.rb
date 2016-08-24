class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :frames

  validates :username, presence: true
end