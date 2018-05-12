class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  # validate the username
  validates :username, length: {
    maximum: 25,
      too_long: "must be between 3 and 25 characters."
    }, length: {
    minimum: 3,
      too_short: "must be between 3 and 25 characters."
  },
  uniqueness: { case_sensitive: false }

  # alphanumeric, and special characters and
  # validate the password
  validates :password, length: {
    maximum: 25,
      too_long: "must be between 3 and 25 characters."
    }, length: {
    minimum: 3,
      too_short: "must be between 3 and 25 characters."
  },
  format: {
    with: /[A-Za-z\s\d\!\#\$%\&\'*\+-.^_\`|~:]/,
      message: "must have one number, letter, capital letter, and special
        character (ie. !, @, #). May contain spaces."
  }

  validates :password_confirmation, presence: true
  
  has_secure_password
end
