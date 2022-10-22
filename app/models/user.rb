class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :address, presence: true
  validates :phone_number, length: {is: 11}
  validates :phone_number, format: {with: /\A(09)\d{9}\z/, message: "has incorrect format should be (09NNNNNNNNN)"}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

end
