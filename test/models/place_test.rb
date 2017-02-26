require 'test_helper'

describe Place do
  let(:place)      { create :place }
  let(:place_name) { 'myspace' }

  describe '#invalid?' do
    it 'fails to validate without a name' do
    end
  end

  describe '#create' do
    it 'transparently creates a place_content record' do
      place = create :place, name: place_name

      assert place.place_contents.count, 1
      assert place.place_contents.last.name, place_name
      assert place.place_contents.last.locale, I18n.locale.to_s
    end

    it 'transparently sets alternate_id on creation' do
      assert place.alternate_id
    end
  end

  describe '#name' do
    describe 'when place_content exists' do
      it 'returns place_content name' do
        place = create :place_with_content

        assert_equal place.name, place.place_content.name
      end
    end
  end
end
