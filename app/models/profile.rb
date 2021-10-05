class Profile < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  auto_strip_attributes :display_name, squish: true
  auto_strip_attributes :avatar_URL, squish: true
  auto_strip_attributes :about_me, squish: true
  auto_strip_attributes :location, squish: true
  auto_strip_attributes :instagram_username, squish: true
  auto_strip_attributes :twitter_username, squish: true
  auto_strip_attributes :discord_username, squish: true

  validates :display_name,        presence: true,
                                  length: { maximum: 50 },
                                  obscenity: { message: 'Obscene words are not allowed.' }
  validates :avatar_URL,          format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                                            message: 'is invalid without http or https.' },
                                  allow_blank: true
  validates :about_me,            length: { maximum: 500 },
                                  obscenity: { message: 'Obscene words are not allowed.' }
  validates :location,            length: { maximum: 75 },
                                  obscenity: { message: 'Obscene words are not allowed.' }
  # Based on Documentation
  validates :twitter_username,    length: { maximum: 15 },
                                  format: { with: /\A[a-zA-Z0-9_]*\z/, multiline: false }
  validates :instagram_username,  length: { maximum: 30 },
                                  format: { with: /\A[a-zA-Z0-9_.]*\z/, multiline: false }

  delegate :username, to: :user

  def characters_count
    user.characters.count
  end

  # Override ActiveRecord method so routes will use username instead of id
  def to_param
    username
  end
end
