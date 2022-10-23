json.extract! space, :id, :user_id, :spacecategory_id, :title, :location, :description, :space_size, :weekly_rate, :longitude, :latitude, :space_policies, :created_at, :updated_at
json.url space_url(space, format: :json)
