require 'test_helper'

class CheckinsControllerTest < ActionDispatch::IntegrationTest
  let(:private_checkins) { create_list :checkin, 3 }
  let(:public_checkins)  { create_list :checkin, 2, public: true }

  describe 'GET /checkins' do
    before  { private_checkins }
    subject { JSON.parse body }

    it 'does not return private checkins' do
      get checkins_path

      assert_response :success
      assert_empty subject
    end

    describe 'with public checkins' do
      before { public_checkins }

      it 'only returns public checkins' do
        get checkins_path

        assert_response :success
        assert_equal public_checkins.count, subject.count

        subject.each do |checkin|
          assert Checkin.exists?(id: checkin['id'], public: true)
          assert_includes checkin, 'place'
        end
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
