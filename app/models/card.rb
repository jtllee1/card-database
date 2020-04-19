class Card < ApplicationRecord
  has_many :booster_packs
  has_many :booster_sets, through: :booster_packs
end
