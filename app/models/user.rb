class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  # local remember_token var
  attr_accessor :rememberToken

  # validate the username
  VALID_USERNAME_REGEX = /\A[\w\-]+\z/
  validates :username,
    length: {
      in: 2..15,
        message: "must be between 2 and 15 characters",
    },
    uniqueness: { case_sensitive: false },
    format: {
      # Start string with an alphanumeric character, name can start with an underscore
      # Can only contain letters, numbers and underscores/hyphens thereafter
      with: VALID_USERNAME_REGEX,
        message: "can only contain letters, digits, dashes, and underscores"
    }

  # alphanumeric, and special characters and
  # validate the password
  # contain atleast 1 digit, 1 lowercase, and 1 1 uppercase letters, and between
  # unicode 20 and hex 7E
  VALID_PASSWORD_REGEX = /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E])\z/
  validates :password,
    length: {
      minimum: 10,
        too_short: "must be at least 10 characters"
    },
    format: {
      # Begin string with a digit or character (exclude spaces)
      with: VALID_PASSWORD_REGEX,
        message: "must contain at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number"
    }

  has_secure_password
  validates :password_confirmation,
    presence: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.rememberToken = User.new_token
    update_attribute(:rememberDigest, User.digest(rememberToken))
  end

  # Returns true if the given token matches the digest.
  # if true then we know that the user is authed
  def authenticated?(rememberToken)
    return false if rememberDigest.nil?
    BCrypt::Password.new(rememberDigest).is_password?(rememberToken)
  end

  def forget
    update_attribute(:rememberDigest, nil)
  end

end
