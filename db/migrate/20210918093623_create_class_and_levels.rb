class CreateClassAndLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :class_and_levels do |t|
      t.belongs_to :character, index: true, null: false
      t.string :character_class
      t.string :character_subclass
      t.integer :character_level
      t.timestamps
    end
  end
end
