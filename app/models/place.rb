class Place < ApplicationRecord
  attr_writer :name

  belongs_to :country, optional: true
  belongs_to :city, optional: true

  has_one :place_content , -> { where locale: I18n.locale }

  has_many :place_contents

  before_create :set_alternate_id
  before_save :set_place_content

  validates :name, presence: true

  def name
    return @name if @name.present?

    @name ||= place_content.name if place_content.present?
  end

  private

  def set_alternate_id
    loop do
      self.alternate_id = SecureRandom.hex[0..15]
      break unless self.class.exists? alternate_id: alternate_id
    end
  end

  def set_place_content
    if place_content.present?
      place_content.update! name: name
      return
    end

    # FIXME(toru): This shouldn't matter
    if persisted?
      place_contents.create name: name, locale: I18n.locale
    else
      place_contents.build name: name, locale: I18n.locale
    end
  end
end
