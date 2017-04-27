class PlaceSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :created_at, :category, :links

  belongs_to :category

  def id
    object.external_id
  end

  def links
    # TODO(toru): Stop hard coding the host
    [{ self: place_url(object.external_id, host: 'api.torumk.com') }]
  end
end
