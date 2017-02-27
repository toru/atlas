require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  let(:place_name) { 'foo' }
  let(:place)      { create :place }
  let(:places)     { create_list :place, 5 }

  describe 'GET /places' do
    before  { places }
    subject { JSON.parse body }

    it 'returns an array of places' do
      get places_path

      assert_response :success
      assert_equal places.count, subject.count

      places.each_with_index.each do |place, idx|
        assert_equal place.id, subject[idx]['id']
      end
    end
  end

  describe 'GET /places/:id' do
    before  { place }
    subject { JSON.parse body }

    it 'returns a place object on success' do
      get place_path(id: place.alternate_id)

      assert_response :success
      assert_equal place.id, subject['id']
    end
  end

  describe 'POST /places' do
    it 'fails to create a place without a name' do
      post places_path

      assert_response :bad_request
    end

    it 'creates a place' do
      post places_path, params: { name: name }

      assert_response :success
    end
  end

  describe 'PUT /places/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        put place_path(id: 'xyz')
      end
    end
  end

  describe 'DELETE /places/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        delete place_path(id: 'xyz')
      end
    end
  end
end
