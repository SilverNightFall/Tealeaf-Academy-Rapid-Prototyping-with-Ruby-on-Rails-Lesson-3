class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

    validates :username, presence: true
end
