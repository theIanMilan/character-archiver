class PhysicalAttribute < ApplicationRecord
  belongs_to :character

  auto_strip_attributes :height, squish: true
  auto_strip_attributes :weight, squish: true 
  auto_strip_attributes :eyes, squish: true 
  auto_strip_attributes :skin, squish: true 
  auto_strip_attributes :hair, squish: true

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
