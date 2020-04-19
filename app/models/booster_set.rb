class BoosterSet < ApplicationRecord
  has_many :booster_packs
  has_many :cards, through: :booster_packs
end
