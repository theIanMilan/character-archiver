class CreatePhysicalAttributes < ActiveRecord::Migration[6.1]
  def change
    create_table :physical_attributes do |t|
      t.belongs_to :character
      t.integer :age
      t.string :height
      t.string :weight
      t.string :eyes
      t.string :skin
      t.string :hair
      t.timestamps
    end
  end
end
