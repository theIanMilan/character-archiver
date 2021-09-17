class Profile < ApplicationRecord
  belongs_to :user

  validates :display_name,        length: { maximum: 50 },
                                  format: { with: /[a-zA-Z0-9_.]*/, multiline: false }
  validates :about_me,            length: { maximum: 500 }
  validates :location,            length: { maximum: 50 }
  # Based on Documentation
  validates :twitter_username,    length: { maximum: 15 },
                                  format: { with: /[a-zA-Z0-9_]*/, multiline: false }
  validates :instagram_username,  length: { maximum: 30 },
                                  format: { with: /[a-zA-Z0-9_.]*/, multiline: false }
end
