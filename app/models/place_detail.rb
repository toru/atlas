class PlaceDetail < ApplicationRecord
  belongs_to :place

  validates :name,   presence: true
  validates :locale, presence: true
end
