class CheckinSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at

  belongs_to :place

  def created_at
    object.show_time? ? object.created_at : object.created_at.to_date
  end
end
