class Space < ApplicationRecord

  validates :user_id, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :space_size, presence: true
  validates :is_occupied, presence: true

end
