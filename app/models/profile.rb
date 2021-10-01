class Profile < ApplicationRecord
  belongs_to :user

  validates :display_name,        presence: true,
                                  length: { maximum: 50 },
                                  obscenity: { message: 'Obscene words are not allowed.' }
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
