class Article < ApplicationRecord
  # specify that if the articles item that the comments belong to is destroyed, so
  # are they
  has_many :comments, dependent: :destroy

  # validate that the fields must match regex
  validates :text, :url, :title, presence: true
end
