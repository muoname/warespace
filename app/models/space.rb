class Space < ApplicationRecord
    belongs_to :user
    belongs_to :spacecategory
end
