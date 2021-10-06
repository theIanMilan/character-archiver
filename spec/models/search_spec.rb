require 'rails_helper'

RSpec.describe Search, type: :model do
  subject(:search) { build(:search) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:character) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:search_message) }
    it { is_expected.to validate_length_of(:search_message) }

    it 'is valid with no profane words' do
      expect(search.search_message).not_to be_profane
    end
  end
end
