require 'rails_helper'

describe CommentPolicy do
  subject { described_class.new(user, comment) }

  context 'when user is a visitor' do
    let(:comment) { create(:comment) }
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[create destroy]) }
  end

  context 'when logged in user has no relation to comment' do
    let(:user) { create(:user) }
    let(:comment) { create(:comment) }

    it { is_expected.to permit_action(:create) }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'when user is owner of comment' do
    let(:user) { create(:user) }
    let(:comment) { create(:comment, user: user) }

    it { is_expected.to permit_actions(%i[create destroy]) }
  end

  context 'when user is owner of profile the comment is associated with' do
    let(:user) { create(:user) }
    let(:user_profile) { create(:profile, user: user) }
    let(:comment) { create(:comment, profile: user_profile) }

    it { is_expected.to permit_actions(%i[create destroy]) }
  end

  context 'when user is an admin' do
    let(:user) { create(:user, :admin) }
    let(:comment) { create(:comment) }

    it { is_expected.to permit_actions(%i[create destroy]) }
  end
end
