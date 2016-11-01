class User < ApplicationRecord

  has_secure_password

  has_many :posts
  has_many :rejoiners

  validates :username, :email_address,
            presence: true,
            uniqueness: true
  validates :email_address,
            format: /\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/

  validates :password_token, uniqueness: true, allow_nil: true

  # If'n we had a link to validate, something like this might work:
  # /\bhttp(|s):\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\b/

  def add_token
    update(password_token: SecureRandom::base58)
  end
end
