class Place < ApplicationRecord
  attr_accessor :name

  belongs_to :country, optional: true
  belongs_to :city, optional: true

  has_many :place_details

  before_create :set_alternate_id
  before_save :set_place_detail

  private

  def set_alternate_id
    loop do
      self.alternate_id = SecureRandom.hex[0..11]
      break unless self.class.exists? alternate_id: alternate_id
    end
  end

  def set_place_detail
    pd = place_details.where(locale: I18n.locale).take

    if pd.present?
      pd.update! name: name
      return
    end

    if persisted?
      place_details.create name: name, locale: I18n.locale
    else
      place_details.build name: name, locale: I18n.locale
    end
  end
end
