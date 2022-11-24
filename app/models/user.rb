class User < ApplicationRecord
  
  has_many :spaces

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :phone_number, length: {is: 11}
  validates :phone_number, format: {with: /\A(09)\d{9}\z/, message: "has incorrect format should be (09NNNNNNNNN)"}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def user_fullname
    "#{first_name} #{last_name}"
  end

  def generate_jwt
    JWT.encode({ id: id,
      exp: 60.days.from_now.to_i },
      Rails.application.secrets.secret_key_base)
  end
  

end
