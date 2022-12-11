class User < ApplicationRecord
  before_save :coord_calculator

  geocoded_by :address

  has_many :spaces
  has_many :rents

  # after_validation :geocode, if: :address_changed?

  def address 
    "#{street} #{city} #{zipcode} #{province}"
  end

    private

        def coord_calculator
            results = Geocoder.search(self.address)
            self.latitude = results.first.coordinates[0]
            self.longitude = results.first.coordinates[1]
        end


  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :phone_number, length: {is: 11}
  # validates :phone_number, format: {with: /\A(09)\d{9}\z/, message: "has incorrect format should be (09NNNNNNNNN)"}
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :jwt_authenticatable,
          jwt_revocation_strategy: JwtDenylist
  enum role: [:renter, :admin, :host]
  after_initialize :set_default_role, :if => :new_record?

  # def generate_jwt
  #   JWT.encode({ id: id,
  #               exp: 60.days.from_now.to_i },
  #              Rails.application.secrets.secret_key_base)
  # end

  def set_default_role
    self.role ||= :renter
  end

  def user_fullname
    "#{first_name} #{last_name}"
  end

end
