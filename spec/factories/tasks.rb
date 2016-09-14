FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyString"
    date "2016-09-14 20:03:55"

    trait :all_empty_fields do
      title nil
      description nil
      date nil
    end

    trait :empty_description do
      description nil
    end

    trait :short_title do
      title "Not"
    end

  end
end
