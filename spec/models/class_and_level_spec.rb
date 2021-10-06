require 'rails_helper'

RSpec.describe ClassAndLevel, type: :model do
  subject(:class_and_level) { build(:class_and_level, character: character) }

  let!(:character) { create(:character) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:character) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:character_class) }
    it { is_expected.to validate_length_of(:character_class) }
    it { is_expected.to allow_value('Figh er123_.').for(:character_class) }
    it { is_expected.not_to allow_value('Fight er!!').for(:character_class) }
    it { is_expected.to validate_presence_of(:character_subclass) }
    it { is_expected.to validate_length_of(:character_subclass) }
    it { is_expected.to allow_value('Fighte r123_.').for(:character_subclass) }
    it { is_expected.not_to allow_value('Fig hter!!').for(:character_subclass) }
    it { is_expected.to validate_presence_of(:character_level) }
    it { is_expected.to validate_numericality_of(:character_level) }

    # should_matcher for uniqueness triggers and fails #total_level_less_than30. Opted for ordinary RSpec
    # it { is_expected.to validate_uniqueness_of(:character_subclass).scoped_to(:character_id).with_message('must be unique for the same character') }
    it 'is not valid with duplicate character_class' do
      create(:class_and_level, character: character, character_class: 'fighter')
      class_and_level.character_class = 'fighter'
      expect(class_and_level).not_to be_valid
    end

    # it { is_expected.to validate_uniqueness_of(:character_class).scoped_to(:character_id).with_message('must be unique for the same character') }
    it 'is not valid with duplicate character_subclass' do
      create(:class_and_level, character: character, character_subclass: 'thief')
      class_and_level.character_subclass = 'thief'
      expect(class_and_level).not_to be_valid
    end

    it 'is not obscene' do
      expect(class_and_level.character_class).not_to be_profane
      expect(class_and_level.character_subclass).not_to be_profane
    end
  end

  describe '#total_level_less_than30' do
    it 'is not valid when addtl character_level makes total level over 30' do
      multiclass_char = create(:character_with_multiple_classes, classes_count: 4)
      over30 = build(:class_and_level, character: multiclass_char, character_level: 29)
      expect(over30).not_to be_valid
    end
  end
end
