class CreateClassAndLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :class_and_levels do |t|
      t.belongs_to :character, index: true, null: false
      t.string :character_class, null: false
      t.string :character_subclass, null: false
      t.integer :character_level, null: false
      t.timestamps
    end

    add_index :class_and_levels, [:character_class, :character_id], unique: true
    add_index :class_and_levels, [:character_class, :character_subclass], unique: true,
      name: 'idx_class_and_levels_on_char_class_and_char_subclass'
  end
end
