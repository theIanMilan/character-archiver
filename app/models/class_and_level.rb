class ClassAndLevel < ApplicationRecord
  belongs_to :character

  validates :character_class,     presence: true,
                                  uniqueness: { scope: :character_id, message: 'Must be unique for the same character' },
                                  length: { maximum: 30 },
                                  format: { with: /[a-zA-Z0-9_.]*/, multiline: false }
  validates :character_subclass,  presence: true,
                                  uniqueness: { scope: :character_class, message: 'Must be unique for the same character' },
                                  length: { maximum: 30 },
                                  format: { with: /[a-zA-Z0-9_.]*/, multiline: false }
  validates :character_level,     presence: true,
                                  numericality: { greater_than: 0, less_than_or_equal_to: 30 }
  validate :total_level_less_than30

  def total_level_less_than30
    return if character_id.nil?
    return if Character.find(character_id).class_and_levels.count.zero?

    total_level = character_level + Character.find(character_id).class_and_levels.pluck('SUM(character_level)')[0]
    return unless total_level > 30

    errors.add(:character_level, 'Total character levels cannot exceed 30')
  end
end
