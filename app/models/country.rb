class Country < ApplicationRecord
  has_many :cities
  has_many :places

  validates :name, presence: true
end
