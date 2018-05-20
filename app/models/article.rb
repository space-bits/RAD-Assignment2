class Article < ApplicationRecord
  # specify that if the articles item that the comments belong to is destroyed, so
  # are they
  has_many :comments, dependent: :destroy

  # validate that the fields must be present
  # TODO: add validation
  validates_format_of :url,
    :with => URI::regexp(%w(http https)),
    presence: true



  validates :title,
    length: {in: 10..199},
    presence: true
end
