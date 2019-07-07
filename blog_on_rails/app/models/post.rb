class Post < ApplicationRecord
    # has_many(:comments, dependent: :destroy) 
    
    validates(:title, presence: true,
        uniqueness: {case_sensitive: false}
        length: {minimum: 10, maximum: 50}
        )

    validates(:body, presence: true,
        length: {minimum:10, maximum:50}
        )

end
