class User < ApplicationRecord
  # Other devise options:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, user: 1 }

  validates :email, presence: true,
                    uniqueness: true

  attr_writer :login

  def login
    @login || username || email
  end
end
