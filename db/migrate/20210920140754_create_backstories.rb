class CreateBackstories < ActiveRecord::Migration[6.1]
  def change
    create_table :backstories do |t|
      t.belongs_to :character
      t.text :intro
      t.text :quote_body
      t.string :quote_author
      t.text :appearance
      t.text :personality
      t.text :ideals
      t.text :bonds
      t.text :flaws
      t.text :biography
      t.timestamps
    end
  end
end
