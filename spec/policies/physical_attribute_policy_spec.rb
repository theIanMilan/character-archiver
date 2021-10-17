require 'rails_helper'

describe PhysicalAttributePolicy do
  subject { described_class.new(user, physical_attribute) }

  context 'when user is a visitor' do
    let(:user) { nil }
    let(:character) { create(:character) }
    let(:physical_attribute) { create(:physical_attribute, character: character) }

    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when logged in user has no association with physical_attribute' do
    let(:user) { create(:user) }
    let(:character) { create(:character) }
    let(:physical_attribute) { create(:physical_attribute, character: character) }

    it { is_expected.to forbid_actions(%i[edit update destroy]) }
  end

  context 'when user has association with physical_attribute' do
    let(:user) { create(:user) }
    let(:character) { create(:character, user: user) }
    let(:physical_attribute) { create(:physical_attribute, character: character) }

    it { is_expected.to permit_actions(%i[edit update destroy]) }
  end

  context 'when user is an admin' do
    let(:user) { create(:user, :admin) }
    let(:character) { create(:character) }
    let(:physical_attribute) { create(:physical_attribute, character: character) }

    it { is_expected.to permit_actions(%i[edit update destroy]) }
  end
end
