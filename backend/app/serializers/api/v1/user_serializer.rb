class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number
  has_many :spaces
end
