class SpaceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :user_id, :spacecategory_id, :title, :location, :description, :space_size, :weekly_rate, :longitude, :latitude, :space_policies, :image
  def image
    if object.image.attached?
      {

        url: rails_blob_url(object.image)
      }
    end
  end
end
