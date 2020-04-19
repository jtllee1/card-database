class BoosterPack < ApplicationRecord
  belongs_to :booster_set
  belongs_to :card
end
