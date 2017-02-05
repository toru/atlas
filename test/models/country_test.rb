require 'test_helper'

describe Country do
  describe '#invalid?' do
    let(:country) { create :country }

    it 'fails to validate without a name' do
      country.name = nil

      assert country.invalid?
      assert_includes country.errors, :name
    end
  end
end
