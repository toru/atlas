FactoryGirl.define do
  factory :place do
  end

  factory :place_detail do
    name { 'San Francisco Ferry Building' }
    locale { 'en' }

    place
  end

  factory :city do
    slug { 'san-francisco' }
    name { 'San Francisco' }
  end
end
