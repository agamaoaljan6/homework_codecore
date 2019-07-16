class Post < ApplicationRecord
    # has_many(:comments, dependent: :destroy) 
    has_many :comments, dependent: :destroy
    belongs_to :user
    validates(:title, presence: true, uniqueness: true)

    validates(
      :body,
      length: { minimum: 50}
    )
  
end
