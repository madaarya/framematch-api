class User < ApplicationRecord
  has_secure_token
  has_secure_password

  has_many :frames
  has_many :props

  validates :username, presence: true
  validates :username, uniqueness: true
end