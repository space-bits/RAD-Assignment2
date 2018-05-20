class Article < ApplicationRecord
  # specify that if the articles item that the comments belong to is destroyed, so
  # are they
  has_many :comments, dependent: :destroy

  # validate that the fields must be present
  # TODO: add validation
  validates :url, 
    presence: true

  validates :title,
    length: {in: 10..199},
    presence: true
end
