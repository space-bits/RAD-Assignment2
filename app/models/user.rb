class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  # validate the username
  validates :username, length: {
    maximum: 15,
      too_long: "must be between 2 and 15 characters."
    }, length: {
    minimum: 2,
      too_short: "must be between 2 and 15 characters."
  },
  uniqueness: { case_sensitive: false }

  # alphanumeric, and special characters and
  # validate the password
  validates :password, length: {
    minimum: 10,
      too_short: "Password must be at least 10 characters."
  },
  format: {
    with: /[A-Za-z\s\d\!\#\$%\&\'*\+-.^_\`|~:]/,
      message: "Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number."
  }

  validates :password_confirmation, presence: true

  has_secure_password
end
