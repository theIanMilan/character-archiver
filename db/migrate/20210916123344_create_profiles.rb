class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: { unique: false }, foreign_key: true
      t.string :display_name
      t.string :avatar
      t.text :about_me
      t.date :date_of_birth
      t.string :location
      t.string :twitter_username
      t.string :instagram_username
      t.string :discord_username
      t.timestamps
    end
  end
end
