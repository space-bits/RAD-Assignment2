class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy

  # validate the username
  validates :username, presence: true, length: {
    maximum: 25,
      too_long: "must be between 3 and 25 characters"
    }, length: {
    minimum: 3,
      too_short: "must be between 3 and 25 characters"
  }

  # validate the password
  validates :password, presence: true, length: {
    maximum: 25,
      too_long: "must be between 3 and 25 characters"
    }, length: {
    minimum: 3,
      too_short: "must be between 3 and 25 characters"
  }

  validates :password_confirmation, presence: true
end
