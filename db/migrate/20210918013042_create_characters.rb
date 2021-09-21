class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.belongs_to :user, index: true
      t.string :character_name
      t.string :character_portrait_URL
      t.string :portrait_credit_artist
      t.string :portrait_credit_URL
      t.string :background, index: true
      t.integer :alignment
      t.string :race, index: true
      t.string :sex
      t.string :gender
      t.string :sexual_orientation
      t.boolean :private?, default: false
      t.timestamps
    end
  end
end
