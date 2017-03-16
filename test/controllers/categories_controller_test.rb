require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  let(:category_id) { 'xyz' }
  let(:category)    { create :category }
  let(:categories)  { create_list :category, 5 }

  describe 'GET /categories' do
    before  { categories }
    subject { JSON.parse body }

    it 'returns an array of places' do
      get categories_path

      assert_response :success
      assert_equal categories.count, subject.count

      categories.each_with_index do |cat, idx|
        assert_equal cat.slug, subject[idx]['slug']
      end
    end
  end

  describe 'GET /categories/:id' do
    before  { category }
    subject { JSON.parse body }

    it 'returns a category object on success' do
      get category_path(id: category.slug)

      assert_response :success
      assert_equal category.slug, subject['slug']
      assert_equal category.name, subject['name']
    end

    it 'returns not_found on non-existing record' do
      get category_path(id: category_id)

      assert_response :not_found
    end
  end

  describe 'POST /categories' do
    subject { JSON.parse body }

    it 'fails to create a category without a name' do
      post categories_path

      assert_response :bad_request
    end

    it 'creates a category' do
      post categories_path, params: { slug: 'test', name: name }

      assert_response :success
      assert_equal name, subject['name']
    end
  end

  describe 'PUT /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        put category_path(id: category_id)
      end
    end
  end

  describe 'DELETE /categories/:id' do
    it 'raises an error' do
      assert_raise AbstractController::ActionNotFound do
        delete category_path(id: category_id)
      end
    end
  end
end
