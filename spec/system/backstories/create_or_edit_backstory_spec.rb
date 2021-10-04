require 'rails_helper'
require 'support/create_character'
require './spec/backstories_helper'

RSpec.describe 'Create or Edit Backstory', type: :system do
  include BackstoriesHelper
  include_context 'when user has a new character'

  before do
    driven_by(:rack_test)
  end

  describe 'Creating Backstory to a Character w/o prior association' do
    context 'with valid details' do
      before { create_character_backstory(character, 'dVVV') }

      it 'redirects to its character page with details' do
        expect(page).to have_current_path(character_path(character))
        expect(page).to have_text('dVVV')
      end

      it 'creates a Backstory record' do
        expect(Backstory.count).to eq 1
        expect(character.backstory.persisted?).to eq(true)
      end
    end

    context 'with invalid details' do
      before { create_character_backstory(character, Faker::Lorem.paragraph_by_chars(number: 10_001, supplemental: false)) }

      it 'does not create a Backstory record' do
        expect(Backstory.count).to eq 0
      end
    end
  end

  describe 'Updating Backstory to a Character w/ prior association' do
    context 'with valid details' do
      before do
        create_character_backstory(character, 'dVVV')
        update_character_backstory(character, 'BBBB')
      end

      it 'redirects to its character page with details' do
        expect(page).to have_current_path(character_path(character))
        expect(page).not_to have_content('dVVV')
        expect(page).to have_content('BBBB')
      end
    end

    context 'with invalid details' do
      before do
        create_character_backstory(character, 'dVVV')
        update_character_backstory(character, Faker::Lorem.paragraph_by_chars(number: 10_001, supplemental: false))
      end

      it 'does not update details in Backstory record' do
        expect(Backstory.first.biography).to eq('dVVV')
      end
    end
  end

  describe 'Delete button' do
    context 'when Character has no prior association' do
      it 'does not display the Delete button' do
        visit edit_character_backstories_path(character)
        expect(page).not_to have_content('Delete Backstory details')
      end
    end

    context 'when Character has prior association' do
      before { create_character_backstory(character, 'dVVV') }

      it 'does display the Delete button' do
        visit edit_character_backstories_path(character)
        expect(page).to have_content('Delete Backstory details')
      end
    end
  end
end
