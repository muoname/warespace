class Spacecategory < ApplicationRecord
    has_many :spaces

    validates :category_name, presence: true
end
