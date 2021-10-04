class Backstory < ApplicationRecord
  belongs_to :character
  validates :intro,         presence: true,
                            length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :quote_body,    length: { maximum: 500 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :quote_author,  obscenity: { message: 'Obscene words are not allowed.' }
  validates :appearance,    length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :personality,   length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :ideals,        length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :bonds,         length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :flaws,         length: { maximum: 4_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
  validates :biography,     presence: true,
                            length: { maximum: 10_000 },
                            obscenity: { message: 'Obscene words are not allowed.' }
end
