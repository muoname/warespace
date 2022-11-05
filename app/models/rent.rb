class Rent < ApplicationRecord

    belongs_to :space
    belongs_to :user

    validates :duration, presence: true
    validates :duration, numericality: true

end
