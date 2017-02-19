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

  describe '#name' do
    describe 'when place_detail exists' do
      it 'returns place_detail name' do
        place = create :place_with_detail

        assert_equal place.name, place.place_detail.name
      end
    end

    describe 'when place_detail does not exist' do
      it 'returns nil' do
        assert_nil place.name
      end
    end
  end
end
