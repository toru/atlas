require 'test_helper'

describe Place do
  let(:place) { build :place }

  describe '#save' do
    it 'transparently sets alternate_id on creation' do
      place.save
      assert place.alternate_id
    end
  end
end
