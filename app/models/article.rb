class Article < ApplicationRecord
  # specify that if the articles item that the comments belong to is destroyed, so
  # are they
  has_many :comments, dependent: :destroy

  # validate that the fields must be present
  # TODO: add validation
  validates_format_of :url,
    :with => URI::regexp(%w(http https)),
      message: "must be a valid url"

  validates :title,
    length: {
      in: 10..199,
        message: "must be between 10 and 200 characters"
    },
    presence: true
end
