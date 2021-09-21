class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.belongs_to :character, index: true, null: false
      t.boolean :searching_for_connections?, default: true, null: false
      t.text :search_message
      t.timestamps
    end
  end
end
