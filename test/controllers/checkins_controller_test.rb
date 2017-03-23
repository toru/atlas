require 'test_helper'

class CheckinsControllerTest < ActionDispatch::IntegrationTest
  describe 'GET /checkins' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get checkins_path
      end
    end
  end

  describe 'GET /checkins/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get checkin_path(id: 'x')
      end
    end
  end

  describe 'POST /checkins' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        post checkins_path
      end
    end
  end

  describe 'PUT /checkins/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        put checkin_path(id: 'x')
      end
    end
  end

  describe 'DELETE /checkins/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        delete checkin_path(id: 'x')
      end
    end
  end
end
