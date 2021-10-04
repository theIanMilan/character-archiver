require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }

    it 'is valid with no profane words' do
      expect(comment.body).not_to be_profane
    end
  end

  context 'with invalid attributes' do
    it 'is not valid with no body' do
      comment.body = nil
      expect(comment).not_to be_valid
    end

    it 'is not valid with body of over 500 characters' do
      comment.body = Faker::Lorem.paragraph_by_chars(number: 501, supplemental: false)
      expect(comment).not_to be_valid
    end
  end
end
