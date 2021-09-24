class PhysicalAttribute < ApplicationRecord
  belongs_to :character

  # auto_strip_attributes %i[height weight eyes skin hair], squish: true

  validates :height,  length: { maximum: 50 },
                      obscenity: { message: 'Obscene words are not allowed.' }
  validates :weight,  length: { maximum: 50 },
                      obscenity: { message: 'Obscene words are not allowed.' }
  validates :eyes,    length: { maximum: 50 },
                      obscenity: { message: 'Obscene words are not allowed.' }
  validates :skin,    length: { maximum: 50 },
                      obscenity: { message: 'Obscene words are not allowed.' }
  validates :hair,    length: { maximum: 50 },
                      obscenity: { message: 'Obscene words are not allowed.' }
end
