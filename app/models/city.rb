class City < ApplicationRecord
  belongs_to :country, optional: true
end
