require 'faker'
require 'factory_bot_rails'
require 'byebug'

User.create!([
  {email: 'theIanMilan@character-archiver.com', username: 'TheDungeonKeeper', password: 'password', role: 0},
  {email: 'user@example.com', username: 'commoner', password: 'password' }
])

user1 = User.find(2)
3.times { FactoryBot.create(:character_full_associations, user: user1) }
3.times { FactoryBot.create(:character_full_associations) }
FactoryBot.reload
2.times { FactoryBot.create(:character_with_multiple_classes, classes_count: 4) }
