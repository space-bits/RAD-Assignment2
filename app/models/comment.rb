class Comment < ApplicationRecord
  belongs_to :News
  belongs_to :User
end
