require 'rails_helper'
require 'support/create_character'
require './spec/searches_helper'

RSpec.describe 'Deleting Search', type: :system do
  include SearchesHelper
  include_context 'when user has a new character'

  before do
    driven_by(:selenium_chrome_headless)
  end

  describe 'Deleting Search details of Character w/ prior association' do
    context 'when deleting Search details' do
      before do
        create_character_search(character, 'dVVV')
        visit edit_character_searches_path(character)

        click_link 'Delete Search details'
        page.driver.browser.switch_to.alert.accept
      end

      it 'displays success message' do
        expect(page).to have_content('Search details has been successfully deleted!')
      end

      it 'destroys the association' do
        sleep(1)
        expect(Search.count).to eq 0
      end
    end
  end
end
