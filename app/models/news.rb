class News < ApplicationRecord
  validates :by, presence: true
end
