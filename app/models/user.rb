class User < ApplicationRecord
   has_secure_password
   geocoded_by :street_line   # can also be an IP address
   after_validation :geocode

    has_many :pages, dependent: :destroy
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence:   true,
                      uniqueness: {case_sensitive: false},
                      format:     VALID_EMAIL_REGEX
    validates :first_name, presence: true
    validates :last_name, presence: true
  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end


end
