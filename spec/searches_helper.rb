module SearchesHelper
  def create_character_search(character, message)
    visit edit_character_searches_path(character)
    page.check('Searching for connections')
    fill_in 'Search message', with: message
    click_on 'Create Search Details'
  end

  def update_character_search(character, message)
    visit edit_character_searches_path(character)
    page.check('Searching for connections')
    fill_in 'Search message', with: message
    click_on 'Update Search Details'
  end
end
