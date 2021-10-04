class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates :body,            presence: true,
                              length: { maximum: 500 },
                              obscenity: { message: 'Obscene words are not allowed.' }
end
