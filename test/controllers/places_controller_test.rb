require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  let(:place_name) { 'foo' }

  describe 'GET /places' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get places_path
      end
    end
  end

  describe 'GET /places/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get place_path(id: 'xyz')
      end
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
