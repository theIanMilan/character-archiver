class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :character_name
      t.string :chracter_portrait_URL
      t.string :portrait_credit_artist
      t.string :portrait_credit_link
      # t.string :class
      # t.string :subclass
      # t.integer :level
      t.string :background
      t.integer :alignment
      t.string :race
      t.string :sex
      t.string :gender
      t.string :sexual_orientation
      t.boolean :private?, default: false
      t.timestamps
    end
  end
end
