require 'test_helper'

describe Category do
  describe '#invalid?' do
    let(:category) { create :category }

    it 'fails to validate without a name' do
      category.name = nil

      assert category.invalid?
      assert_includes category.errors, :name
    end
  end
end
