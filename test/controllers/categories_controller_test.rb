require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  let(:place_id) { 'xyz' }

  describe 'GET /categories' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get categories_path
      end
    end
  end

  describe 'GET /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        get category_path(id: place_id)
      end
    end
  end

  describe 'POST /categories' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        post categories_path
      end
    end
  end

  describe 'PUT /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        put category_path(id: place_id)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        delete category_path(id: place_id)
      end
    end
  end
end
