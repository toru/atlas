class CheckinSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at

  has_one :place

  def created_at
    object.show_time? ? object.created_at : object.created_at.to_date
  end
end
