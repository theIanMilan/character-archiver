require 'rails_helper'

RSpec.describe Backstory, type: :model do
  subject(:backstory) { build(:backstory) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }

    it 'is valid with no profane words' do
      expect(backstory.body).not_to be_profane
      expect(backstory.personality).not_to be_profane
      expect(backstory.ideals).not_to be_profane
      expect(backstory.bonds).not_to be_profane
      expect(backstory.flaws).not_to be_profane
    end
  end

  context 'with invalid attributes' do
    it 'is not valid with body of over 4_000 characters' do
      backstory.body = Faker::Lorem.paragraph_by_chars(number: 4_001, supplemental: false)
      expect(backstory).not_to be_valid
    end

    it 'is not valid with personality of over 500 characters' do
      backstory.personality = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(backstory).not_to be_valid
    end

    it 'is not valid with ideals of over 500 characters' do
      backstory.ideals = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(backstory).not_to be_valid
    end

    it 'is not valid with bonds of over 500 characters' do
      backstory.bonds = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(backstory).not_to be_valid
    end

    it 'is not valid with flaws of over 500 characters' do
      backstory.flaws = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(backstory).not_to be_valid
    end
  end
end
