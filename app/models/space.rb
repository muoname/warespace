class Space < ApplicationRecord
    belongs_to :user
    belongs_to :spacecategory

    # one attached image
    has_one_attached :image

    # many images attached
    has_many_attached :pictures


    # method to resize hero image on _space.html.erb
    def image_as_hero
        
        image.variant(resize_to_limit: [300, 300]).processed
        
    end

    # method to resize multiple image as thumbnails on _space.html.erb
    def pictures_as_thumb

        pictures.map do |pic|
            pic.variant(resize_to_limit: [150, 150]).processed
        end

    end

end
