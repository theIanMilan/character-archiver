class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :characters, dependent: :destroy

  # Other devise options:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, supermoderator: 1, moderator: 2, basic: 9 }

  validates :email,    presence: true,
                       uniqueness: true
  validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       # only allow letter, number, underscore and punctuation. i.e. prevent @
                       format: { with: /^[a-zA-Z0-9_.]*$/, multiline: true },
                       obscenity: { message: 'Obscene words are not allowed.' }

  after_create :create_user_profile

  def create_user_profile
    create_profile(display_name: username)
  end

  attr_writer :login

  def login
    @login || username || email
  end

  # Overwrite devise method

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
