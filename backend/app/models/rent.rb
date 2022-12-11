class Rent < ApplicationRecord
    belongs_to :user
    has_many :spaces
end
