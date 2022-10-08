class Rent < ApplicationRecord
  validates :space_id, presence: true
  validates :user_id, presence: true
  validates :duration, presence: true
end
