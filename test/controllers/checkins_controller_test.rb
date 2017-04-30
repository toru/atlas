require 'test_helper'

class CheckinsControllerTest < ActionDispatch::IntegrationTest
  let(:private_checkins) { create_list :checkin, 3 }
  let(:public_checkins)  { create_list :checkin, 2, is_public: true }
  let(:place)            { create :place }
  let(:comment)          { 'amazing pancakes' }

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
          assert Checkin.exists?(id: checkin['id'], is_public: true)
          assert_includes checkin, 'place'
        end
      end
    end
  end

  describe 'GET /checkins/:id' do
    let(:public_checkin)  { public_checkins.last }
    let(:private_checkin) { private_checkins.last }

    it 'returns a place object on success' do
      get checkin_path(id: public_checkin.id)

      assert_response :success
    end

    describe 'with a non-existing checkin id' do
      it 'returns not_found' do
        get checkin_path(id: 'bad_id')

        assert_response :not_found
      end
    end

    describe 'with a private checkin id' do
      it 'returns not_found' do
        get checkin_path(id: private_checkin.id)

        assert_response :not_found
      end
    end
  end

  describe 'GET /checkins/latest' do
    subject { JSON.parse body }

    describe 'when there are no public checkins' do
      it 'returns nil' do
        get latest_checkins_path

        assert_response :success
        assert_nil subject
      end
    end

    describe 'when public checkins exist' do
      before do
        public_checkins.last.created_at += 1.hour
        public_checkins.last.save
      end

      it 'returns the latest checkin' do
        get latest_checkins_path

        assert_response :success
        assert_equal public_checkins.last.id, subject['id']
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
      assert_equal 'yyyy-mm-dd'.length, subject['created_at'].length
    end

    it 'creates a private checkin record by default' do
      post checkins_path(place_id: place.external_id)

      assert_response :success
      refute Checkin.find(subject['id']).is_public?
    end

    describe 'with show_time parameter' do
      it 'returns success with full created_at attribute' do
        post checkins_path(place_id: place.external_id, show_time: '1')

        assert_response :success
        assert_equal place.external_id, subject['place']['id']
        assert_operator 'yyyy-mm-dd'.length, :<, subject['created_at'].length
      end
    end
  end

  describe 'PUT /checkins/:id' do
    subject { JSON.parse body }

    it 'returns not_found on non-existing record' do
      put checkin_path(id: 'x')

      assert_response :not_found
    end

    it 'updates an existing record' do
      checkin = public_checkins.last

      put checkin_path(id: checkin), params: { comment: comment }

      assert_response :success
      assert_equal comment, subject['comment']
    end

    it 'updates the visibility of a checkin' do
      checkin = private_checkins.last

      refute checkin.is_public?

      put checkin_path(id: checkin), params: { is_public: '1' }
      checkin.reload

      assert_response :success
      assert checkin.is_public?
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
