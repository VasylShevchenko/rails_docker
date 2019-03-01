class User < ApplicationRecord
  authenticates_with_sorcery!

  # attr_accessible :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :email
  validates_uniqueness_of :email

  # validates :email,
  #           length: { maximum: 255 },
  #           format: { with: VALID_EMAIL_REGEX }
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze


end
