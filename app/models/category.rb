class Category < ApplicationRecord
  validates :slug, presence: true
  validates :name, presence: true

  has_many :places
end
