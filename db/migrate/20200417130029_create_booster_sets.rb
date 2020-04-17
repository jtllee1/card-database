class CreateBoosterSets < ActiveRecord::Migration[6.0]
  def change
    create_table :booster_sets do |t|
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
