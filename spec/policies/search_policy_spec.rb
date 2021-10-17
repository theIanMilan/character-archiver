require 'rails_helper'

describe SearchPolicy do
  subject { described_class.new(user, search) }

  context 'when user is a visitor' do
    let(:user) { nil }
    let(:character) { create(:character) }
    let(:search) { create(:search, character: character) }

    it { is_expected.to permit_actions(:search_board) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when logged in user has no association with search' do
    let(:user) { create(:user) }
    let(:character) { create(:character) }
    let(:search) { create(:search, character: character) }

    it { is_expected.to permit_actions(:search_board) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when user has association with search' do
    let(:user) { create(:user) }
    let(:character) { create(:character, user: user) }
    let(:search) { create(:search, character: character) }

    it { is_expected.to permit_actions(%i[search_board edit update destroy]) }
  end

  context 'when user is an admin' do
    let(:user) { create(:user, :admin) }
    let(:character) { create(:character) }
    let(:search) { create(:search, character: character) }

    it { is_expected.to permit_actions(%i[search_board edit update destroy]) }
  end
end
