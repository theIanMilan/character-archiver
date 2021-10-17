require 'rails_helper'

describe BackstoryPolicy do
  subject { described_class.new(user, backstory) }

  context 'when user is a visitor' do
    let(:user) { nil }
    let(:character) { create(:character) }
    let(:backstory) { create(:backstory, character: character) }

    it { is_expected.to permit_actions(:folklore) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when logged in user has no association with backstory' do
    let(:user) { create(:user) }
    let(:character) { create(:character) }
    let(:backstory) { create(:backstory, character: character) }

    it { is_expected.to permit_actions(:folklore) }
    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when user has association with backstory' do
    let(:user) { create(:user) }
    let(:character) { create(:character, user: user) }
    let(:backstory) { create(:backstory, character: character) }

    it { is_expected.to permit_actions(%i[folklore edit update destroy]) }
  end

  context 'when user is an admin' do
    let(:user) { create(:user, :admin) }
    let(:character) { create(:character) }
    let(:backstory) { create(:backstory, character: character) }

    it { is_expected.to permit_actions(%i[folklore edit update destroy]) }
  end
end
