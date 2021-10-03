class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :symbol_URL
      t.string :type
      t.string :base_of_operations
      t.text :goals
      t.text :intro
      t.text :quote
      t.text :organization_history
      t.timestamps
    end
  end
end
