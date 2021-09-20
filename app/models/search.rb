class Search < ApplicationRecord
  belongs_to :character

  validates :searching_for_connections?, inclusion: [true, false]
  validates :search_message,             length: { maximum: 500 },
                                         obscenity: { message: 'Obscene words are not allowed.' }
end
