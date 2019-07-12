class Comment < ApplicationRecord
  belongs_to :post
  validates :body, uniqueness: true
end
