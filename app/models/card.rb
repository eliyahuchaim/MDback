class Card < ApplicationRecord
  belongs_to :user
  belongs_to :user, through: :reaction
end
