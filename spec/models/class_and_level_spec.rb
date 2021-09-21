require 'rails_helper'

RSpec.describe ClassAndLevel, type: :model do
  subject(:class_and_level) { build(:class_and_level, character: character) }

  let!(:character) { create(:character) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  context 'with invalid character_class' do
    it 'is not valid without character_class' do
      class_and_level.character_class = nil
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with duplicate character_class' do
      create(:class_and_level, character: character, character_class: 'fighter')
      class_and_level.character_class = 'fighter'
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with character_class length of over 30' do
      class_and_level.character_class = Faker::Internet.username(specifier: 31..31)
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with invalid character_class format' do
      class_and_level.character_class = 'Fighter_!'
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with obscene text in character_class' do
      class_and_level.character_class = 'bimbo'
      expect(class_and_level).not_to be_valid
    end
  end

  context 'with invalid character_subclass' do
    it 'is not valid without character_subclass' do
      class_and_level.character_subclass = nil
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with duplicate character_subclass' do
      create(:class_and_level, character: character, character_subclass: 'thief')
      class_and_level.character_subclass = 'thief'
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with character_subclass length of over 30' do
      class_and_level.character_subclass = Faker::Internet.username(specifier: 31..31)
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with invalid character_subclass format' do
      class_and_level.character_subclass = "Fighter_@'Hero'!"
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with obscene text in character_subclass' do
      class_and_level.character_subclass = 'bullshit'
      expect(class_and_level).not_to be_valid
    end
  end

  context 'with invalid character_level' do
    it 'is not valid without character_level' do
      class_and_level.character_level = nil
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid with out of acceptable range character_level' do
      class_and_level.character_level = 31
      expect(class_and_level).not_to be_valid
      class_and_level.character_level = 0
      expect(class_and_level).not_to be_valid
    end

    it 'is not valid when addtl character_level makes total level over 30' do
      multiclass_char = create(:character_with_multiple_classes, classes_count: 4)
      over30 = build(:class_and_level, character: multiclass_char, character_level: 29)
      expect(over30).not_to be_valid
    end
  end
end
