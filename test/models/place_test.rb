require 'test_helper'

describe Place do
  let(:place)      { create :place }
  let(:place_name) { 'myspace' }

  describe '#create' do
    it 'transparently creates a place_detail record' do
      place = create :place, name: place_name

      assert place.place_details.count, 1
      assert place.place_details.last.name, place_name
      assert place.place_details.last.locale, I18n.locale.to_s
    end
  end

  describe '#save' do
    it 'transparently sets alternate_id on creation' do
      assert place.alternate_id
    end
  end
end
