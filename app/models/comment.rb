class Comment < ApplicationRecord
  belongs_to :article

  VALID_BODY_REGEX = /\s*\S\s*\S\s*\S.*/
  validates :body,
    presence: {
      message: "can't be blank"
    },
    length: {
      in: 3..1000,
        message: "must be between 3 and 1000 characters"
    },
    format: {
      with: VALID_BODY_REGEX
    }

  validates :user_id,
    presence: true

  validates :article_id,
    presence: true
end
