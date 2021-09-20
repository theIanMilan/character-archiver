require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) { build(:profile) }

  context 'with valid attributes' do
    it 'is valid with twitter_username using _' do
      profile.twitter_username = 'ab_bbjb_n'
      expect(profile).to be_valid
    end

    it 'is valid with instagram_username using . and _' do
      profile.instagram_username = 'period_icity.lights'
      expect(profile).to be_valid
    end

    it 'is valid with no profane words' do
      expect(profile.display_name).not_to be_profane
      expect(profile.about_me).not_to be_profane
      expect(profile.location).not_to be_profane
    end
  end

  context 'with nil attributes' do
    it 'is valid with nil display_name' do
      profile.display_name = nil
      expect(profile).to be_valid
    end

    it 'is valid with nil twitter_username' do
      profile.twitter_username = nil
      expect(profile).to be_valid
    end

    it 'is valid with nil instagram_username' do
      profile.instagram_username = nil
      expect(profile).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is not valid with display name of over 50 characters' do
      profile.display_name = Faker::Internet.username(specifier: 51..51)
      expect(profile).not_to be_valid
    end

    it 'is not valid with about_me of over 500 characters' do
      profile.display_name = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(profile).not_to be_valid
    end

    it 'is not valid with location of over 50 characters' do
      profile.location = Faker::Internet.username(specifier: 51)
      expect(profile).not_to be_valid
    end

    it 'is not valid with twitter_username of over 15 characters' do
      profile.twitter_username = Faker::Internet.username(specifier: 16)
      expect(profile).not_to be_valid
    end

    it 'is not valid with invalid twitter_username format' do
      profile.twitter_username = 'abacus.gregory'
      expect(profile).not_to be_valid
    end

    it 'is not valid with instagram_username of over 30 characters' do
      profile.instagram_username = Faker::Internet.username(specifier: 31)
      expect(profile).not_to be_valid
    end

    it 'is not valid with invalid instagram_username format' do
      profile.instagram_username = 'abacus.gregory!'
      expect(profile).not_to be_valid
    end
  end
end
