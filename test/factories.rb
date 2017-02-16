FactoryGirl.define do
  sequence(:unique_slug) { |i| "unique-slug-#{i}" }
  sequence(:unique_name) { |i| "unique name #{i}" }

  factory :place do
    factory :place_with_detail do
      after(:create) do |place|
        create_list :place_detail, 1, place: place
      end
    end
  end

  factory :place_detail do
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
    name { generate :unique_name }
  end
end
