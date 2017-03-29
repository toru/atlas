require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  let(:place_name)   { 'foo' }
  let(:place)        { create :place }
  let(:places)       { create_list :place, 5 }
  let(:bad_place_id) { 'xyz' }

  describe 'GET /places' do
    before  { places }
    subject { JSON.parse body }

    it 'returns an array of places' do
      get places_path

      assert_response :success
      assert_equal places.count, subject.count

      places.each_with_index do |place, idx|
        assert_equal place.external_id, subject[idx]['id']
        assert_equal place.name, subject[idx]['name']
      end
    end
  end

  describe 'GET /places/:id' do
    before  { place }
    subject { JSON.parse body }

    it 'returns a place object on success' do
      get place_path(id: place.external_id)

      assert_response :success
      assert_equal place.external_id, subject['id']
      assert_equal place.name, subject['name']
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
    subject { JSON.parse body }

    it 'returns not_found on non-existing record' do
      put place_path(id: bad_place_id)

      assert_response :not_found
    end

    it 'updates an existing record' do
      put place_path(id: place.external_id), params: { name: place_name }

      assert_response :success
      assert_equal place_name, subject['name']
    end
  end

  describe 'DELETE /places/:id' do
    it 'returns not_found on non-existing record' do
      delete place_path(id: bad_place_id)

      assert_response :not_found
    end

    it 'deletes an existing record' do
      delete place_path(id: place.external_id)

      assert_response :success
    end

    it 'deletes associated place_contents' do
      refute_empty place.place_contents

      delete place_path(id: place.external_id)

      assert_response :success
      assert_empty place.place_contents.reload
    end
  end
end
