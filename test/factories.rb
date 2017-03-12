FactoryGirl.define do
  sequence(:unique_slug) { |i| "unique-slug-#{i}" }
  sequence(:unique_name) { |i| "unique name #{i}" }

  factory :place do
    name { generate :unique_name }

    factory :place_with_content do
      after(:create) { |place| place.reload }
    end
  end

  factory :place_content do
    name { generate :unique_name }
    locale { 'en' }

    association :place, strategy: :build
  end

  factory :country do
    slug { generate :unique_slug }
    name { generate :unique_name }
  end

  factory :city do
    slug { generate :unique_slug }
    name { generate :unique_name }
  end

  factory :category do
    slug { generate :unique_slug }
    name { generate :unique_name }
  end
end
