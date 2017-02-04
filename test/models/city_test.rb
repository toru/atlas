require 'test_helper'

describe City do
  describe '#invalid?' do
    let(:city) { create :city }

    it 'fails to validate without a name' do
      city.name = nil

      assert city.invalid?
      assert_includes city.errors, :name
    end
  end
end
