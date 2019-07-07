class Post < ApplicationRecord
    # has_many(:comments, dependent: :destroy) 
    has_many :comments, dependent: :destroy
    validates(:title, presence: true, uniqueness: true)

    validates(
      :body,
      length: { minimum: 10, maximum: 50 }
    )
  
end
