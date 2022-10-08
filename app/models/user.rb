class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :is_renter, presence: true

  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :phone, length: {is: 11}
  validates :phone, format: {with: /\A(09)\d{9}\z/, message: "has incorrect format should be (09NNNNNNNNN)"}
end
