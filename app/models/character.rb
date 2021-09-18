class Character < ApplicationRecord
  belongs_to :user
  has_many :class_and_levels, dependent: :destroy

  enum alignment: {
    lawful_good:    0, neutral_good: 1, chaotic_good:    2,
    lawful_neutral: 3, true_neutral: 4, chaotic_neutral: 5,
    lawful_evil:    6, neutral_evil: 7, chaotic_evil:    8
  }
end
