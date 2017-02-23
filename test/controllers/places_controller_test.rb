require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test 'GET /places' do
    assert_raise AbstractController::ActionNotFound do
      get places_path
    end
  end

  test 'GET /places/:id' do
    assert_raise AbstractController::ActionNotFound do
      get place_path(id: 'xyz')
    end
  end

  test 'fails to create a place without a name' do
    post places_path

    assert_response :bad_request
  end

  test 'creates a place when name is specified' do
    post places_path, params: { name: 'foo' }

    assert_response :success
  end

  test 'PUT /places/:id' do
    assert_raise AbstractController::ActionNotFound do
      put place_path(id: 'xyz')
    end
  end

  test 'DELETE /places/:id' do
    assert_raise AbstractController::ActionNotFound do
      delete place_path(id: 'xyz')
    end
  end
end
