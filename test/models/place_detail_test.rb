require 'test_helper'

describe PlaceDetail do
  describe '#invalid?' do
    let(:place_detail) { create :place_detail }

    it 'fails to validate without a name' do
      place_detail.name = nil

      assert place_detail.invalid?
      assert_includes place_detail.errors, :name
    end

    it 'fails to validate without a locale' do
      place_detail.locale = nil

      assert place_detail.invalid?
      assert_includes place_detail.errors, :locale
    end

    it 'fails to validate with unknown locale' do
      place_detail.locale = 'xyz'

      assert place_detail.invalid?
      assert_includes place_detail.errors, :locale
    end
  end
end
