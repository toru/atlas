class City < ApplicationRecord
  belongs_to :country, optional: true

  has_many :places

  validates :name, presence: true
end
