require 'faker'
require 'factory_bot_rails'
require 'byebug'

User.create!([
  {email: 'theIanMilan@character-archiver.com', username: 'TheDungeonKeeper', password: 'password', role: 0},
  {email: 'user@example.com', username: 'commoner', password: 'password' }
])