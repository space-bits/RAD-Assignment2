class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  # validate the username
  validates :username, length: {
    maximum: 15,
      too_long: "must be between 2 and 15 characters"
    }, length: {
    minimum: 2,
      too_short: "must be between 2 and 15 characters"
  },
  uniqueness: { case_sensitive: false },
  format: {
    # Start string with an alphanumeric character, name can start with an underscore
    # Can only contain letters, numbers and underscores/hyphens thereafter
    with: /\A[^\W][[A-Za-z]\-\d\_[^\!\@\#\$\%\^\&\*\(\)\]]]+/,
      message: "can only contain letters, digits, dashes, and underscores"
  }

  # alphanumeric, and special characters and
  # validate the password
  validates :password, length: {
    minimum: 10,
      too_short: "must be at least 10 characters."
  },
  format: {
    # Begin string with a digit or character (exclude spaces)
    with: /[\A\d]*[[A-Za-z]\s[\d][\W\w]]+/,
      message: "must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number."
  }

  validates :password_confirmation, presence: true

  has_secure_password
end
