class Backstory < ApplicationRecord
  belongs_to :character

  # :nullify (enabled by default) - replaces empty strings with nil.
  # :strip (enabled by default) - removes whitespaces from the beginning and the
  auto_strip_attributes :intro
  auto_strip_attributes :quote_body
  auto_strip_attributes :quote_author
  auto_strip_attributes :appearance
  auto_strip_attributes :personality
  auto_strip_attributes :ideals
  auto_strip_attributes :bonds
  auto_strip_attributes :flaws
  auto_strip_attributes :biography

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
