class City < ApplicationRecord
  belongs_to :country, optional: true

  has_many :places
end
