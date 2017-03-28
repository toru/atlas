class CheckinSerializer < ActiveModel::Serializer
  attributes :id, :comment, :created_at

  has_one :place
end
