require 'rails_helper'

RSpec.describe PhysicalAttribute, type: :model do
  subject(:physical_attribute) { build(:physical_attribute) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:character) }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:height) }
    it { is_expected.to validate_length_of(:weight) }
    it { is_expected.to validate_length_of(:eyes) }
    it { is_expected.to validate_length_of(:skin) }
    it { is_expected.to validate_length_of(:hair) }

    it 'is valid with no profane words' do
      expect(physical_attribute.height).not_to be_profane
      expect(physical_attribute.weight).not_to be_profane
      expect(physical_attribute.eyes).not_to be_profane
      expect(physical_attribute.skin).not_to be_profane
      expect(physical_attribute.hair).not_to be_profane
    end
  end
end
