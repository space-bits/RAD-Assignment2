class Article < ApplicationRecord
  # specify that if the articles item that the comments belong to is destroyed, so
  # are they
  has_many :comments, dependent: :destroy

  # validate that the fields must be present
  # TODO: add validation
  validates :text, :url, :title,
    presence: true
end
