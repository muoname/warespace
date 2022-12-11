class Space < ApplicationRecord
    has_many :rents
    belongs_to :user
    
    before_save :coord_calculator
    geocoded_by :address
    
    def address 
        "#{street} #{city} #{zipcode} #{province}"
    end
    
    private

        def coord_calculator
            results = Geocoder.search(self.address)
            self.latitude = results.first.coordinates[0]
            self.longitude = results.first.coordinates[1]
        end
   
        
    belongs_to :user
    belongs_to :rents
    belongs_to :spacecategory


    # one attached image
    has_one_attached :image

    # many images attached
    has_many_attached :pictures


    # method to resize hero image on _space.html.erb
    def image_as_hero
        
        # only show hero with these file types
        return unless image.content_type.in?(%w[image/jpg image/png image/jpeg])

        image.variant(resize_to_limit: [300, 300]).processed
        
    end

    # method to resize multiple image as thumbnails on _space.html.erb
    def pictures_as_thumb

        pictures.map do |pic|
            pic.variant(resize_to_limit: [150, 150]).processed
        end

    end

    def latlong
        addr = Geocoder.search(location)
        addr.first.coordinates
    end


end
