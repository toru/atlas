require 'test_helper'

class CheckinsControllerTest < ActionDispatch::IntegrationTest
  let(:private_checkins) { create_list :checkin, 3 }
  let(:public_checkins)  { create_list :checkin, 2, public: true }
  let(:place)            { create :place }

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
    subject { JSON.parse body }

    it 'returns 400 bad_request without a place_id param' do
      post checkins_path

      assert_response :bad_request
      assert_match /place_id/, subject['message']
    end

    it 'returns 404 not_found if the place_id is invalid' do
      post checkins_path(place_id: 'x')

      assert_response :not_found
    end

    it 'creates a new checkin record' do
      post checkins_path(place_id: place.external_id)

      assert_response :success
      assert_equal place.external_id, subject['place']['id']
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
