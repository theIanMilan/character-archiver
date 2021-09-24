class Character < ApplicationRecord
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  extend AutoStripAttributes

  belongs_to :user
  has_many :class_and_levels,  dependent: :destroy
  has_one :search,             dependent: :destroy
  has_one :physical_attribute, dependent: :destroy
  has_one :backstory,          dependent: :destroy

  accepts_nested_attributes_for :class_and_levels,
                                allow_destroy: true,
                                reject_if: :all_blank

  enum alignment: {
    lawful_good:    0, neutral_good: 1, chaotic_good:    2,
    lawful_neutral: 3, true_neutral: 4, chaotic_neutral: 5,
    lawful_evil:    6, neutral_evil: 7, chaotic_evil:    8
  }

  # Squeezes spaces inside the string: "James     Bond  " => "James Bond"
  auto_strip_attributes :character_name,         squish: true
  auto_strip_attributes :character_portrait_URL, squish: true
  auto_strip_attributes :portrait_credit_artist, squish: true
  auto_strip_attributes :portrait_credit_URL,    squish: true
  auto_strip_attributes :background,             squish: true
  auto_strip_attributes :race,                   squish: true
  auto_strip_attributes :sex,                    squish: true
  auto_strip_attributes :gender,                 squish: true
  auto_strip_attributes :sexual_orientation,     squish: true

  validates :character_name,         presence: true,
                                     obscenity: { message: 'Obscene words are not allowed.' }
  validates :character_portrait_URL, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                                     allow_nil: true
  validates :portrait_credit_artist, length: { maximum: 50 }
  validates :portrait_credit_URL,    format: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                                     allow_nil: true
  validates :background,             presence: true,
                                     length: { maximum: 50 },
                                     obscenity: { message: 'Obscene words are not allowed.' }
  validates :alignment,              presence: true,
                                     inclusion: { in: alignments.keys }
  validates :race,                   presence: true,
                                     length: { maximum: 30 },
                                     obscenity: { message: 'Obscene words are not allowed.' }
  validates :sex,                    presence: true,
                                     length: { maximum: 20 },
                                     obscenity: { message: 'Obscene words are not allowed.' }
  validates :gender,                 length: { maximum: 30 },
                                     obscenity: { message: 'Obscene words are not allowed.' }
  validates :sexual_orientation,     length: { maximum: 30 },
                                     obscenity: { message: 'Obscene words are not allowed.' }
  validates :private_character,      inclusion: [true, false]

  def classes_string
    str = ''
    records = class_and_levels.order('character_level DESC')

    case records.count
    when 1
      # Subclass Class Level
      classes_string_substring(records[0])
    when 2
      # Subclass Class Level and Subclass Class Level
      str << classes_string_substring(records[0])
      str << ' and ' << classes_string_substring(records[1])
      str
    else
      # Subclass Class Level, Subclass Class Level, and Subclass Class Level
      records.each_with_index do |data, idx|
        str << 'and ' if idx == (class_and_levels.count - 1)
        str << classes_string_substring(data) << ', '
      end
      str[0...-2]
    end
  end

  def alignment_formatted
    alignment.sub('_', ' ').titlecase
  end

  def display_character_portrait
    character_portrait_URL || 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Unknown-human-picture.png'
  end

  private

  def classes_string_substring(record)
    "#{record.character_subclass.titlecase} #{record.character_class.titlecase} #{record.character_level}"
  end
end
