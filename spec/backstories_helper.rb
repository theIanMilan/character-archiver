module BackstoriesHelper
  def create_character_backstory(character, message)
    visit edit_character_backstories_path(character)
    fill_in 'Backstory', with: message
    fill_in 'Personality', with: 'AAA'
    fill_in 'Ideals', with: 'BBB'
    fill_in 'Bonds', with: 'CCC'
    fill_in 'Flaws', with: 'DDD'
    click_on 'Create Backstory Details'
  end

  def update_character_backstory(character, message)
    visit edit_character_backstories_path(character)
    fill_in 'Backstory', with: message
    fill_in 'Personality', with: 'EEE'
    fill_in 'Ideals', with: 'FFF'
    fill_in 'Bonds', with: 'GGG'
    fill_in 'Flaws', with: 'HHH'
    click_on 'Update Backstory Details'
  end
end
