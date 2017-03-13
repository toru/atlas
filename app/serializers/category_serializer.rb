class CategorySerializer < ActiveModel::Serializer
  attributes :slug, :name, :created_at
end
