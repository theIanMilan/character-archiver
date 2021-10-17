require 'rails_helper'

describe CharacterPolicy do
  subject { described_class.new(user, character) }

  context 'when user is a visitor' do
    let(:character) { create(:character) }
    let(:user) { nil }

    it { is_expected.to permit_actions(%i[index show]) }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_actions(%i[update destroy]) }
  end

  context 'when logged in user does NOT own character' do
    let(:user) { create(:user) }
    let(:character) { create(:character) }

    it { is_expected.to permit_actions(%i[index show]) }
    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to forbid_actions(%i[update destroy]) }
  end

  context 'when user owns character' do
    let(:user) { create(:user) }
    let(:character) { create(:character, user: user) }

    it { is_expected.to permit_actions(%i[index show create update destroy]) }
  end

  context 'when user is an admin' do
    let(:user) { create(:user, :admin) }
    let(:character) { create(:character) }

    it { is_expected.to permit_actions(%i[index show create update destroy]) }
  end
end
