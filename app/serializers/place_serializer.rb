class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  belongs_to :category

  def id
    object.alternate_id
  end
end
