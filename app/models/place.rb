class Place < ApplicationRecord
  attr_writer :name

  belongs_to :category, optional: true
  belongs_to :country,  optional: true
  belongs_to :city,     optional: true

  has_one :place_content , -> { where locale: I18n.locale }

  has_many :place_contents, dependent: :destroy
  has_many :checkins

  before_create :set_external_id
  before_save :set_place_content

  validates :name, presence: true

  def name
    return @name if @name.present?

    @name ||= place_content.name if place_content.present?
  end

  private

  def set_external_id
    loop do
      self.external_id = SecureRandom.hex[0..15]
      break unless self.class.exists? external_id: external_id
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
