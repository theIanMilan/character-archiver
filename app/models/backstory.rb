class Backstory < ApplicationRecord
  belongs_to :character

  validates :body,          length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :personality,   length: { maximum: 500 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :ideals,        length: { maximum: 500 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :bonds,         length: { maximum: 500 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :flaws,         length: { maximum: 500 },
                            obscenity: { message: 'Obscene words are not allowed.' }
end
