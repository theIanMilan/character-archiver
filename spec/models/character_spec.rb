require 'rails_helper'

RSpec.describe Character, type: :model do
  subject(:character) { build(:character) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  context 'with invalid length attributes' do
    it 'is not valid with portrait credit artist of over 50 characters' do
      character.portrait_credit_artist = Faker::Internet.username(specifier: 51..51)
      expect(character).not_to be_valid
    end

    it 'is not valid with background of over 50 characters' do
      character.background = Faker::Internet.username(specifier: 51..51)
      expect(character).not_to be_valid
    end

    it 'is not valid with race of over 30 characters' do
      character.race = Faker::Internet.username(specifier: 31)
      expect(character).not_to be_valid
    end

    it 'is not valid with sex of over 20 characters' do
      character.sex = Faker::Internet.username(specifier: 21)
      expect(character).not_to be_valid
    end

    it 'is not valid with gender of over 30 characters' do
      character.gender = Faker::Internet.username(specifier: 31)
      expect(character).not_to be_valid
    end

    it 'is not valid with sexual orientation of over 30 characters' do
      character.sexual_orientation = Faker::Internet.username(specifier: 31)
      expect(character).not_to be_valid
    end
  end

  context 'with nil attributes' do
    it 'is not valid with no character_name' do
      character.character_name = nil
      expect(character).not_to be_valid
    end

    it 'is not valid with no background' do
      character.background = nil
      expect(character).not_to be_valid
    end

    it 'is not valid with no alignment' do
      character.alignment = nil
      expect(character).not_to be_valid
    end

    it 'is not valid with no race' do
      character.race = nil
      expect(character).not_to be_valid
    end

    it 'is not valid with no sex' do
      character.sex = nil
      expect(character).not_to be_valid
    end
  end

  context 'with obscene text' do
    it 'is not valid with obscene text in display_name' do
      character.character_name = 'Mister.Shitface'
      expect(character).not_to be_valid
    end

    it 'is not valid with obscene text in background' do
      character.background = 'fucker'
      expect(character).not_to be_valid
    end

    it 'is not valid with obscene text in race' do
      character.race = 'tits'
      expect(character).not_to be_valid
    end

    it 'is not valid with obscene text in sex' do
      character.sex = 'bitch'
      expect(character).not_to be_valid
    end

    it 'is not valid with obscene text in gender' do
      character.gender = 'biatch'
      expect(character).not_to be_valid
    end

    it 'is not valid with obscene text in sexual_orientation' do
      character.sexual_orientation = 'faggot'
      expect(character).not_to be_valid
    end
  end

  context 'with other invalid attributes' do
    it 'is not valid with invalid alignment' do
      expect { character.alignment = 'True Evil' }.to raise_error(ArgumentError)
      expect { character.alignment = '10' }.to raise_error(ArgumentError)
    end

    it 'is not valid with invalid http URL' do
      character.portrait_credit_link = 'twitter.com/dungeonMaster'
      expect(character).not_to be_valid
    end
  end
end
