require 'rails_helper'
require 'support/create_character'
require './spec/physical_attributes_helper'

RSpec.describe 'Create or Edit Physical Attributes', type: :system do
  include PhysicalAttributesHelper
  include_context 'when user has a new character'

  before do
    driven_by(:rack_test)
  end

  describe 'Creating Physical Attributes to a Character w/o prior association' do
    context 'with valid details' do
      before { create_character_physical_attributes(character, 'dVVV') }

      it 'redirects to its character page with details' do
        expect(page).to have_current_path(character_path(character))
        expect(page).to have_content('dVVV')
      end

      it 'creates a Physical Attribute record' do
        expect(PhysicalAttribute.count).to eq 1
        expect(character.physical_attribute.persisted?).to eq(true)
      end
    end

    context 'with invalid details' do
      before { create_character_physical_attributes(character, Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false)) }

      it 'does not create a Physical Attribute record' do
        expect(PhysicalAttribute.count).to eq 0
      end
    end
  end

  describe 'Updating Physical Attributes to a Character w/ prior association' do
    context 'with valid details' do
      before do
        create_character_physical_attributes(character, 'dVVV')
        update_character_physical_attributes(character, 'BBBB')
      end

      it 'redirects to its character page with details' do
        expect(page).to have_current_path(character_path(character))
        expect(page).not_to have_content('dVVV')
        expect(page).to have_content('BBBB')
      end
    end

    context 'with invalid details' do
      before do
        create_character_physical_attributes(character, 'dVVV')
        update_character_physical_attributes(character, Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false))
      end

      it 'does not update details in Physical Attribute record' do
        expect(PhysicalAttribute.first.hair).to eq('dVVV')
      end
    end
  end

  describe 'Delete button' do
    context 'when Character has no prior association' do
      it 'does not display the Delete button' do
        visit edit_character_physical_attributes_path(character)
        expect(page).not_to have_content('Delete all Physical Attributes')
      end
    end

    context 'when Character has prior association' do
      before { create_character_physical_attributes(character, 'dVVV') }

      it 'does display the Delete button' do
        visit edit_character_physical_attributes_path(character)
        expect(page).to have_content('Delete all Physical Attributes')
      end
    end
  end
end
