class Checkin < ApplicationRecord
  MAX_ID_LEN = 16

  before_create :set_id

  private

  def set_id
    retries_allowed = 3

    loop do
      self.id = SecureRandom.hex[0..(MAX_ID_LEN-1)]
      break unless Checkin.exists?(id)

      retries_allowed -= 1
      break unless retries_allowed > 0
    end
  end
end
