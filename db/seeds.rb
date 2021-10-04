require 'faker'
require 'factory_bot_rails'
# require 'byebug'

User.create!([
  {email: 'theIanMilan@character-archiver.com', username: 'TheDungeonKeeper', password: 'password', role: 0},
  {email: 'user1@example.com', username: 'commoner', password: 'password' },
  {email: 'user2@example.com', username: 'DrowHighborn', password: 'password' }
])

user1 = User.find(2)
user1_profile = user1.profile
user1_profile.avatar_URL = 'https://i.redd.it/pvjdif3371y41.png'
user1_profile.save!

user2 = User.find(3)
3.times { FactoryBot.create(:character_full_associations, user: user2) }
3.times { FactoryBot.create(:character_full_associations) }
FactoryBot.reload
2.times { FactoryBot.create(:character_with_multiple_classes, classes_count: 4) }

char = user1.characters.create(character_name: 'Theo Reinhardt',
                               character_portrait_URL: 'https://i.redd.it/gh43ukmi4sp11.jpg',
                               portrait_credit_artist: 'killtasticles', 
                               portrait_credit_URL: 'https://www.instagram.com/killtasticles',
                               background: 'Sage',
                               alignment: 'lawful_good',
                               race: 'Half-Orc',
                               sex: 'Male',
                               gender: 'Male',
                               sexual_orientation: 'Asexual',
                               private_character: false)
char.class_and_levels.create(character_class: 'Wizard',
                             character_subclass: 'Abjuration',
                             character_level: 8)
char.create_backstory(body: 'Theo, a former member of the Orc Clan, Rivashek, is trying to forget his past and living a more civilized life. But he feels he has to face his clan members sooner or later.',
                      personality: 'Bookish and innocently prude. Is awkward in social situations.',
                      flaws: 'Is easily distracted by the promise of information.',
                      bonds: 'Working to preserve a great library at his current city.',
                      ideals: 'Knowledge. Seeks to attain and discover the secrets of the multiverse.')                             
char.create_search(searching_for_connections: true,
                   search_message: 'Currently seeking the companionship of able-bodied adventurers in discovering the secrets that await in The Sunless Citadel.')
char.create_physical_attribute(hair: 'Shaggy moss green',
                               skin: 'Medium green',
                               eyes: 'Black',
                               age: 28,
                               height: '180 cm',
                               weight: '171 lbs')

char1 = FactoryBot.create(:character, character_portrait_URL: 'https://64.media.tumblr.com/c457bbb848101717e87b8519003ac80f/tumblr_nck6ur4pBf1tdrmq5o1_500.jpg',
                                      portrait_credit_artist: 'WOO HYUNG LEE', 
                                      portrait_credit_URL: 'http://knightandknights.com/post/98559730533/by-woo-hyung-lee',
                                      race: 'Human', 
                                      background: 'Mercenary',
                                      sex: 'Male', gender: 'Male')
char1.class_and_levels.create(character_class: 'Fighter',
                              character_subclass: 'Champion',
                              character_level: rand(3..12))

char2 = FactoryBot.create(:character, character_portrait_URL: 'https://cdnb.artstation.com/p/assets/images/images/000/083/459/medium/FireElf.jpg?1443928516',
                                      portrait_credit_artist: 'Even Amundsen', 
                                      portrait_credit_URL: 'https://www.artstation.com/artwork/fireelf', 
                                      race: 'Elf', 
                                      background: 'Outlaw',
                                      sex: 'Female', gender: 'Non-binary')
char2.class_and_levels.create(character_class: 'Blood Hunter',
                              character_subclass: 'Order of the Exorcist',
                              character_level: rand(3..12))

char3 = FactoryBot.create(:character, character_portrait_URL: 'https://2.bp.blogspot.com/-2csOQ8lWb0M/U_L_i5C3VRI/AAAAAAAACPw/_2wyzoYCMRY/s1600/Female_DragonbornSilverPaladin.jpg',
                                      portrait_credit_artist: 'John-Paul Balmet', 
                                      portrait_credit_URL: 'http://jpbalmet.blogspot.gr/2014/08/dungeons-and-dragons-5th-edition.html', 
                                      race: 'Dragonborn', 
                                      background: 'Hermit',
                                      sex: 'Female', gender: 'Female')
char3.class_and_levels.create(character_class: 'Paladin',
                              character_subclass: 'Vengence',
                              character_level: rand(3..12))

char4 = FactoryBot.create(:character, character_portrait_URL: 'https://i.pinimg.com/originals/ad/d9/05/add9055cdd4c400325f2f8c9e1620482.png',
                                      portrait_credit_artist: 'Glenn Wallace', 
                                      portrait_credit_URL: 'https://www.pinterest.com/pin/487866572112835954/', 
                                      race: 'Orc', 
                                      background: 'Urchin',
                                      sex: 'Female', gender: 'Male')
char4.class_and_levels.create(character_class: 'Rogue',
                              character_subclass: 'Swashbuckler',
                              character_level: rand(3..12))

FactoryBot.create(:comment, user: user2, profile: user1.profile)