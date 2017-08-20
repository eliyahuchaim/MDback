class Article < ApplicationRecord
  has_one :post
  has_many :reactions
end
