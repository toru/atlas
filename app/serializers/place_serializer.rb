class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  def id
    object.alternate_id
  end
end
