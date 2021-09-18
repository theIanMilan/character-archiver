class ClassAndLevel < ApplicationRecord
  belongs_to :character

  validates :character_class,     prescence: true,
                                  length: { maximum: 30 },
                                  format: { with: /[a-zA-Z0-9_.]*/, multiline: false }
  validates :character_subclass,  prescence: true,
                                  length: { maximum: 30 },
                                  format: { with: /[a-zA-Z0-9_.]*/, multiline: false }
  validates :character_level,     prescence: true,
                                  numericality: { greater_than: 0, less_than_or_equal_to: 30 }
end
