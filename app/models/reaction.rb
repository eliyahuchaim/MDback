class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :article

  has_one :card
end
