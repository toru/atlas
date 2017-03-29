class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  belongs_to :category

  def id
    object.external_id
  end
end
