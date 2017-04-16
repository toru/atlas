require 'test_helper'

describe Checkin do
  describe '#public?' do
    let(:checkin) { create :checkin}

    it 'returns false by default' do
      refute checkin.public?
    end
  end
end
