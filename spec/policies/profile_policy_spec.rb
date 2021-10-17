require 'rails_helper'

describe ProfilePolicy do
  subject { described_class.new(user, profile) }

  context 'when user is a visitor' do
    let(:profile) { create(:profile) }
    let(:user) { nil }

    it { is_expected.to permit_actions(%i[show user_characters]) }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context 'when logged in user does NOT own profile' do
    let(:user) { create(:user) }
    let(:profile) { create(:profile) }

    it { is_expected.to permit_actions(%i[show user_characters]) }
    it { is_expected.to forbid_edit_and_update_actions }
  end

  context 'when user is owner of profile' do
    let(:user) { create(:user) }
    let(:profile) { create(:profile, user: user) }

    it { is_expected.to permit_actions(%i[show user_characters]) }
    it { is_expected.to permit_edit_and_update_actions }
  end

  context 'when user is an admin' do
    let(:user) { create(:user, :admin) }
    let(:profile) { create(:profile) }

    it { is_expected.to permit_actions(%i[show user_characters]) }
    it { is_expected.to permit_edit_and_update_actions }
  end
end
