require 'rails_helper'

RSpec.describe PhysicalAttribute, type: :model do
  subject(:physical_attribute) { build(:physical_attribute) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }

    it 'is valid with no profane words' do
      expect(physical_attribute.height).not_to be_profane
      expect(physical_attribute.weight).not_to be_profane
      expect(physical_attribute.eyes).not_to be_profane
      expect(physical_attribute.skin).not_to be_profane
      expect(physical_attribute.hair).not_to be_profane
    end
  end

  context 'with invalid length attributes' do
    it 'is not valid with height of over 50 characters' do
      physical_attribute.height = Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false)
      expect(physical_attribute).not_to be_valid
    end

    it 'is not valid with weight of over 50 characters' do
      physical_attribute.weight = Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false)
      expect(physical_attribute).not_to be_valid
    end

    it 'is not valid with skin of over 50 characters' do
      physical_attribute.skin = Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false)
      expect(physical_attribute).not_to be_valid
    end

    it 'is not valid with eyes of over 50 characters' do
      physical_attribute.eyes = Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false)
      expect(physical_attribute).not_to be_valid
    end

    it 'is not valid with hair of over 50 characters' do
      physical_attribute.hair = Faker::Lorem.paragraph_by_chars(number: 51, supplemental: false)
      expect(physical_attribute).not_to be_valid
    end
  end
end
