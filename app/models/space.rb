class Space < ApplicationRecord
  validates :space_id, presence: true
  validates :user_id, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :space_size, presence: true
  validates :is_occupied, presence: true

end
