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

  test 'POST /places' do
    assert_raise AbstractController::ActionNotFound do
      post places_path
    end
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
