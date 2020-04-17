class BoosterPack < ApplicationRecord
  belongs_to :booster_set
  has_many :cards
end
