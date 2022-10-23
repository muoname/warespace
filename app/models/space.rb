class Space < ApplicationRecord
    belongs_to :user
    belongs_to :spacecategory

    # one attached image
    has_one_attached :image

    # many images attached
    has_many_attached :pictures

end
