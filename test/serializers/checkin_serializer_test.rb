require 'test_helper'

describe CheckinSerializer do
  let(:checkin) { create :checkin }

  describe '#created_at' do
    subject do
      serializer = CheckinSerializer.new checkin
    end

    describe 'when show_time is false' do
      it 'returns a Date object' do
        refute checkin.show_time?
        assert subject.created_at.is_a? Date
      end
    end

    describe 'when show_time is true' do
      before do
        checkin.show_time = true
      end

      it 'returns a TimeWithZone object' do
        assert checkin.show_time?
        assert subject.created_at.is_a? ActiveSupport::TimeWithZone
      end
    end
  end
end
