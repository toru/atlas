require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test 'transparent alternate_id generation on create' do
    place = Place.create
    assert place.alternate_id
  end
end
