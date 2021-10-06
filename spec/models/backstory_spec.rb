require 'rails_helper'

RSpec.describe Backstory, type: :model do
  subject(:backstory) { build(:backstory) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:character) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:intro) }
    it { is_expected.to validate_length_of(:intro) }
    it { is_expected.to validate_length_of(:quote_body) }
    it { is_expected.to validate_length_of(:appearance) }
    it { is_expected.to validate_length_of(:personality) }
    it { is_expected.to validate_length_of(:ideals) }
    it { is_expected.to validate_length_of(:bonds) }
    it { is_expected.to validate_length_of(:flaws) }
    it { is_expected.to validate_presence_of(:biography) }
    it { is_expected.to validate_length_of(:biography) }

    it 'is valid with no profane words' do
      expect(backstory.intro).not_to be_profane
      expect(backstory.quote_body).not_to be_profane
      expect(backstory.quote_author).not_to be_profane
      expect(backstory.appearance).not_to be_profane
      expect(backstory.personality).not_to be_profane
      expect(backstory.ideals).not_to be_profane
      expect(backstory.bonds).not_to be_profane
      expect(backstory.flaws).not_to be_profane
      expect(backstory.biography).not_to be_profane
    end
  end
end
