require 'test_helper'

describe Checkin do
  describe '#is_public?' do
    let(:checkin) { create :checkin}

    it 'returns false by default' do
      refute checkin.is_public?
    end
  end
end
