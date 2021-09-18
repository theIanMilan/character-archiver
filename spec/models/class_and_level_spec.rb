require 'rails_helper'

RSpec.describe ClassAndLevel, type: :model do
  subject(:class_and_level) { build(:class_and_level) }

  context 'with valid attributes' do
    it { is_expected.to be_valid }
  end

  # context 'with invalid attributes' do
  #   it 'is not valid when class levels exceed 30' do
  #     class_and_level.character_level = 29
  #     expect(class_and_level).not_to be_valid
  #   end
  # end

  context 'with succeeding invalid attributes' do
    let!(:character) { character_with_multiple_classes(classes_count: 4) }

    it 'is not valid when addtl character_level makes total level over 30' do
      over30 = build(:class_and_level, character: character, character_level: 29)
      expect(over30).not_to be_valid
    end
  end
end
