require 'rails_helper'
require 'support/create_character'
require './spec/physical_attributes_helper'

RSpec.describe 'Deleting Physical Attributes', type: :system do
  include PhysicalAttributesHelper
  include_context 'when user has a new character'

  before do
    driven_by(:selenium_chrome_headless)
  end

  describe 'Deleting Physical Attributes of Character w/ prior association' do
    context 'when deleting physical attributes' do
      before do
        create_character_physical_attributes(character, 'dVVV')
        visit edit_character_physical_attributes_path(character)

        click_link 'Delete all Physical Attributes'
        page.driver.browser.switch_to.alert.accept
      end

      it 'displays success message' do
        expect(page).to have_content('Physical Attributes successfully deleted!')
      end

      it 'destroys the association' do
        sleep(1)
        expect(PhysicalAttribute.count).to eq 0
      end
    end
  end
end
