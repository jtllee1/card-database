class CreateBoosterPacks < ActiveRecord::Migration[6.0]
  def change
    create_table :booster_packs do |t|
      t.string :card_number
      t.string :card_rarity
      t.references :card, null: false, foreign_key: true
      t.references :booster_set, null: false, foreign_key: true

      t.timestamps
    end
  end
end
