require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) { build(:profile) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
    it { is_expected.to allow_value(nil).for(:avatar_URL) }
    it { is_expected.to allow_value(nil).for(:twitter_username) }
    it { is_expected.to allow_value(nil).for(:instagram_username) }
    it { is_expected.to allow_value(nil).for(:discord_username) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:display_name) }
    it { is_expected.to validate_length_of(:display_name) }
    it { is_expected.to allow_value('http://').for(:avatar_URL) }
    it { is_expected.not_to allow_value('twitter.com').for(:avatar_URL) }
    it { is_expected.to allow_value('').for(:avatar_URL) }
    it { is_expected.to validate_length_of(:about_me) }
    it { is_expected.to validate_length_of(:twitter_username) }
    it { is_expected.to allow_value('janeAusten_1').for(:twitter_username) }
    it { is_expected.not_to allow_value('jane.austin').for(:twitter_username) }
    it { is_expected.to validate_length_of(:instagram_username) }
    it { is_expected.to allow_value('jane.Austen_1').for(:instagram_username) }
    it { is_expected.not_to allow_value('jane.aust***n').for(:instagram_username) }
    it { is_expected.to validate_length_of(:discord_username) }
    it { is_expected.to allow_value('LilyPads3#6786').for(:discord_username) }
    it { is_expected.not_to allow_value('Journeys#76788').for(:discord_username) }

    it 'is valid with no profane words' do
      expect(profile.display_name).not_to be_profane
      expect(profile.about_me).not_to be_profane
      expect(profile.location).not_to be_profane
    end
  end

  describe '#characters_count' do
    context "when Profile's user has no characters" do
      it 'returns 0' do
        expect(profile.characters_count).to eq(0)
      end
    end

    context "when Profile's user has characters" do
      it 'returns an integer' do
        create(:character, user: profile.user)
        expect(profile.characters_count).to eq(1)
      end
    end
  end
end
