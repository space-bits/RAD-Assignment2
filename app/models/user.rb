class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy

  # validate the username
  validates :username, length: {
    maximum: 25,
      too_long: "Username must be between 3 and 25 characters"
    }, length: {
    minimum: 3,
      too_short: "Username must be between 3 and 25 characters"
  }

  # validate the password
  validates :password, length: {
    maximum: 25,
      too_long: "Password must be between 3 and 25 characters"
    }, length: {
    minimum: 3,
      too_short: "Password must be between 3 and 25 characters"
  }
end
