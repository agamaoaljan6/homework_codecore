class User < ApplicationRecord
    has_secure_password

    has_many :posts, dependent: :nullify
    has_many :comments, dependent: :nullify

    validates :first_name, :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, 
    format: { with: VALID_EMAIL_REGEX }

    def full_name
     "#{first_name} #{last_name}".strip
     "#{first_name} #{last_name}".strip.titleize
    end

end
