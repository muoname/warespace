class Rent < ApplicationRecord

    belongs_to :space
    belongs_to :user

    validates :user_id, presence: true
    validates :space_id, presence: true
    validates :duration, presence: true
    validates :duration, numericality: true

end
