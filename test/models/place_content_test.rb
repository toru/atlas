require 'test_helper'

describe PlaceContent do
  describe '#invalid?' do
    let(:place_content) { build :place_content }

    it 'fails to validate without a name' do
      place_content.name = nil

      assert place_content.invalid?
      assert_includes place_content.errors, :name
    end

    it 'fails to validate without a locale' do
      place_content.locale = nil

      assert place_content.invalid?
      assert_includes place_content.errors, :locale
    end

    it 'fails to validate with unknown locale' do
      place_content.locale = 'xyz'

      assert place_content.invalid?
      assert_includes place_content.errors, :locale
    end
  end
end
