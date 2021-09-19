require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  context 'with invalid attributes' do
    it 'is not valid with duplicate username' do
      create(:user, username: 'IAMLegend')
      expect(build(:user, username: 'iamLEGEND')).not_to be_valid
    end

    it 'is not valid with username with invalid characters' do
      user.username = 'Regina@George'
      expect(user).not_to be_valid
    end

    it 'is not valid without a username' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with duplicate email' do
      create(:user, email: '1234NewEmail@example.com')
      expect(build(:user, email: '1234NewEmail@example.com')).not_to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it 'is not valid with obscene text in username' do
      user.username = 'blueballs'
      expect(user).not_to be_valid
    end
  end
end
