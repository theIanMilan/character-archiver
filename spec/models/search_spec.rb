require 'rails_helper'

RSpec.describe Search, type: :model do
  subject(:search) { build(:search) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }

    it 'is valid with no profane words' do
      expect(search.search_message).not_to be_profane
    end
  end

  context 'with invalid attributes' do
    it 'is not valid with no searching_for_connections' do
      search['searching_for_connections?'] = nil
      expect(search).not_to be_valid
    end

    it 'is not valid with no search_message' do
      search.search_message = nil
      expect(search).not_to be_valid
    end

    it 'is not valid with search_message of over 500 characters' do
      search.search_message = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(search).not_to be_valid
    end

    it 'is not valid with obscene text in search_message' do
      search.search_message = 'Gregory is full of shit!'
      expect(search).not_to be_valid
    end
  end
end
