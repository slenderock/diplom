class Card < ApplicationRecord
  has_one :image, as: :imageable
end