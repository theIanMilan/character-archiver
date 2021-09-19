class Character < ApplicationRecord
  belongs_to :user
  has_many :class_and_levels, dependent: :destroy

  enum alignment: {
    lawful_good:    0, neutral_good: 1, chaotic_good:    2,
    lawful_neutral: 3, true_neutral: 4, chaotic_neutral: 5,
    lawful_evil:    6, neutral_evil: 7, chaotic_evil:    8
  }

  validates :character_name,         presence: true
  validates :chracter_portrait_URL,  format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :portrait_credit_artist, length: { maximum: 50 }
  validates :portrait_credit_link,   format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :background,             presence: true,
                                     length: { maximum: 50 }
  validates :alignment,              presence: true,
                                     inclusion: { in: alignments.keys }
  validates :race,                   presence: true,
                                     length: { maximum: 30 }
  validates :sex,                    presence: true,
                                     length: { maximum: 15 }
  validates :gender,                 length: { maximum: 30 }
  validates :sexual_orientation,     length: { maximum: 30 }
end
