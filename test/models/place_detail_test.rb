require 'test_helper'

describe PlaceDetail do
  describe '#invalid?' do
    it 'fails to validate without a name' do
      place_detail = build :place_detail, name: nil

      assert place_detail.invalid?
      assert_includes place_detail.errors, :name
    end
  end
end
