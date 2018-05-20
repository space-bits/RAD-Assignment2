class Comment < ApplicationRecord
  belongs_to :article

  validates :body,
    presence: true,
    length: {in: 3..1000},
    format: {with: /\s*\S\s*\S\s*\S.*/}
end
