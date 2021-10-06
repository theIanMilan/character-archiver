require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity } # devise ensures all emails stored as lowercase
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to allow_value('Jane.Austen09_127').for(:username) }
    it { is_expected.not_to allow_value('J@nny#').for(:username) }
    it { is_expected.to validate_presence_of(:password) }

    it 'is not obscene' do
      expect(user.username).not_to be_profane
    end
  end
end
