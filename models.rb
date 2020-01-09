class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :user
end
