class CreateBackstories < ActiveRecord::Migration[6.1]
  def change
    create_table :backstories do |t|
      t.belongs_to :character
      t.text :body
      t.text :personality
      t.text :ideals
      t.text :bonds
      t.text :flaws
      t.timestamps
    end
  end
end
