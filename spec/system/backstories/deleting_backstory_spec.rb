require 'rails_helper'
require 'support/create_character'
require './spec/backstories_helper'

RSpec.describe 'Deleting Backstory', type: :system do
  include BackstoriesHelper
  include_context 'when user has a new character'

  before do
    driven_by(:selenium_chrome_headless)
  end

  describe 'Deleting Backstory details of Character w/ prior association' do
    context 'when deleting Backstory details' do
      before do
        create_character_backstory(character, 'dVVV')
        visit edit_character_backstories_path(character)

        click_link 'Delete Backstory details'
        page.driver.browser.switch_to.alert.accept
      end

      it 'displays success message' do
        expect(page).to have_content('Backstory details has been successfully deleted!')
      end

      it 'destroys the association' do
        sleep(1)
        expect(Backstory.count).to eq 0
      end
    end
  end
end
