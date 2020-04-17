class BoosterPack < ApplicationRecord
  has_one :booster_set
  has_one :card
end
