class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :picture
      t.string :card
      t.string :monster_attribute
      t.string :monster_type
      t.string :category
      t.integer :level
      t.integer :atk
      t.integer :def
      t.text :description

      t.timestamps
    end
  end
end
