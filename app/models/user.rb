class User < ApplicationRecord
  has_secure_password
  has_many :reactions
  has_many :cards, through: :reactions
  has_many :posts
  has_many :articles, through: :posts
end
