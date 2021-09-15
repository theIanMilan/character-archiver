class User < ApplicationRecord
  # Other devise options:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, user: 1 }

  validates :email, presence: true,
                    uniqueness: true
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       # only allow letter, number, underscore and punctuation. i.e. prevent @
                       format: { with: /^[a-zA-Z0-9_.]*$/, multiline: true }

  attr_writer :login

  def login
    @login || username || email
  end

  # Overwrite devise method

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login == conditions.delete(:login)
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
