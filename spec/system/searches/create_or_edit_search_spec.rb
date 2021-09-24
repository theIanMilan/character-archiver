require 'rails_helper'
require 'support/create_character'
require './spec/searches_helper'

RSpec.describe 'Create or Edit Search', type: :system do
  include SearchesHelper
  include_context 'when user has a new character'

  before do
    driven_by(:rack_test)
  end

  describe 'Creating Search to a Character w/o prior association' do
    context 'with valid details' do
      before { create_character_search(character, 'dVVV') }

      it 'redirects to its character page with details' do
        expect(page).to have_current_path(character_path(character))
        expect(page).to have_content('dVVV')
      end

      it 'creates a Search record' do
        expect(Search.count).to eq 1
        expect(character.search.persisted?).to eq(true)
      end
    end

    context 'with invalid details' do
      before { create_character_search(character, Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)) }

      it 'does not create a Search record' do
        expect(Search.count).to eq 0
      end
    end
  end

  describe 'Updating Search to a Character w/ prior association' do
    context 'with valid details' do
      before do
        create_character_search(character, 'dVVV')
        update_character_search(character, 'BBBB')
      end

      it 'redirects to its character page with details' do
        expect(page).to have_current_path(character_path(character))
        expect(page).not_to have_content('dVVV')
        expect(page).to have_content('BBBB')
      end
    end

    context 'with invalid details' do
      before do
        create_character_search(character, 'dVVV')
        update_character_search(character, Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false))
      end

      it 'does not update details in Search record' do
        expect(Search.first.search_message).to eq('dVVV')
      end
    end
  end

  describe 'Delete button' do
    context 'when Character has no prior association' do
      it 'does not display the Delete button' do
        visit edit_character_searches_path(character)
        expect(page).not_to have_content('Delete Search details')
      end
    end

    context 'when Character has prior association' do
      before { create_character_search(character, 'dVVV') }

      it 'does display the Delete button' do
        visit edit_character_searches_path(character)
        expect(page).to have_content('Delete Search details')
      end
    end
  end
end
