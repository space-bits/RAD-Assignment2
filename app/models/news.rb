class News < ApplicationRecord
  # specify that if the news item that the comments belong to is destroyed, so
  # are they
  has_many :comments, dependent: :destroy

  # validate that the fields must match regex
  validates :body, :url, :title, presence: true
end
