module BackstoriesHelper
  def fill_in_backstory
    fill_in 'Intro', with: 'intro'
    fill_in 'Quote body', with: 'ZZZ'
    fill_in 'Quote author', with: 'YYY'
    fill_in 'Appearance', with: 'XXX'
    fill_in 'Personality', with: 'EEE'
    fill_in 'Ideals', with: 'FFF'
    fill_in 'Bonds', with: 'GGG'
    fill_in 'Flaws', with: 'HHH'
  end

  def create_character_backstory(character, message)
    visit edit_character_backstories_path(character)
    fill_in 'Biography', with: message
    fill_in_backstory
    click_on 'Create Backstory Details'
  end

  def update_character_backstory(character, message)
    visit edit_character_backstories_path(character)
    fill_in 'Biography', with: message
    fill_in_backstory
    click_on 'Update Backstory Details'
  end
end
