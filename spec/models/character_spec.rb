require 'rails_helper'

RSpec.describe Character, type: :model do
  subject(:character) { build(:character) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }

    it 'is valid with integers 0-8 for alignment' do
      character.alignment = 0
      expect(character).to be_valid
    end

    it 'is valid with alignment names' do
      character.alignment = 'chaotic_neutral'
      expect(character).to be_valid
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:character_name) }
    it { is_expected.to allow_value('http://').for(:character_portrait_URL) }
    it { is_expected.not_to allow_value('twitter.com').for(:character_portrait_URL) }
    it { is_expected.to allow_value('').for(:character_portrait_URL) }
    it { is_expected.to validate_length_of(:portrait_credit_artist) }
    it { is_expected.to allow_value('http://').for(:portrait_credit_URL) }
    it { is_expected.not_to allow_value('twitter.com').for(:portrait_credit_URL) }
    it { is_expected.to allow_value('').for(:portrait_credit_URL) }
    it { is_expected.to validate_presence_of(:background) }
    it { is_expected.to validate_length_of(:background) }
    it { is_expected.to validate_presence_of(:alignment) }
    it { is_expected.to define_enum_for(:alignment).with_values(%w[lawful_good neutral_good chaotic_good lawful_neutral true_neutral chaotic_neutral lawful_evil neutral_evil chaotic_evil]) }
    it { is_expected.to validate_presence_of(:race) }
    it { is_expected.to validate_length_of(:race) }
    it { is_expected.to validate_presence_of(:sex) }
    it { is_expected.to validate_length_of(:sex) }
    it { is_expected.to validate_length_of(:gender) }
    it { is_expected.to validate_length_of(:sexual_orientation) }

    it 'is not obscene' do
      expect(character.character_name).not_to be_profane
      expect(character.background).not_to be_profane
      expect(character.race).not_to be_profane
      expect(character.sex).not_to be_profane
      expect(character.gender).not_to be_profane
      expect(character.sexual_orientation).not_to be_profane
    end
  end

  describe '#total_levels' do
    context 'with 1 class_and_levels record' do
      it 'returns that one character_level' do
        class_and_level = create(:class_and_level, character: character, character_level: 10)
        expect(character.total_levels).to eq(class_and_level.character_level)
      end
    end

    context 'with multiple class_and_levels records' do
      it 'returns sum of character_levels' do
        create(:class_and_level, character: character, character_level: 10)
        create(:class_and_level, character: character, character_level: 4)
        create(:class_and_level, character: character, character_level: 2)
        expect(character.total_levels).to eq((10 + 4 + 2))
      end
    end
  end

  describe '#classes_string' do
    it 'returns comma separated list with and if 3+ elements' do
      create(:class_and_level, character: character,
        character_class: 'Artificer', character_subclass: 'Armorer', character_level: 10)
      create(:class_and_level, character: character,
        character_class: 'Blood Hunter', character_subclass: 'Mutant', character_level: 1)
      create(:class_and_level, character: character,
        character_class: 'Sage', character_subclass: 'Abnormal', character_level: 9)

      expect(character.classes_string).to eq('Armorer Artificer 10, Abnormal Sage 9, and Mutant Blood Hunter 1')
    end

    it 'returns simple string if 1 element' do
      create(:class_and_level, character: character,
        character_class: 'Sage', character_subclass: 'Abnormal', character_level: 9)

      expect(character.classes_string).to eq('Abnormal Sage 9')
    end

    it 'returns string with and if 2 elements' do
      create(:class_and_level, character: character,
        character_class: 'Artificer', character_subclass: 'Armorer', character_level: 10)
      create(:class_and_level, character: character,
        character_class: 'Sage', character_subclass: 'Abnormal', character_level: 9)

      expect(character.classes_string).to eq('Armorer Artificer 10 and Abnormal Sage 9')
    end
  end
end
