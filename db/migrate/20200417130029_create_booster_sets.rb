class CreateBoosterSets < ActiveRecord::Migration[6.0]
  def change
    create_table :booster_sets do |t|
      t.string :name
      t.string :picture
      t.references :booster_pack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
