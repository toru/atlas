FactoryGirl.define do
  factory :place do
  end

  factory :place_detail do
    name { 'San Francisco Ferry Building' }
    locale { 'en' }

    place
  end

  factory :country do
    slug { 'new-zealand' }
    name { 'New Zealand' }
  end

  factory :city do
    slug { 'san-francisco' }
    name { 'San Francisco' }
  end
end
