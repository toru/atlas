class PlaceContent < ApplicationRecord
  belongs_to :place

  validates :name,   presence: true
  validates :locale, presence: true
  validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }
end
