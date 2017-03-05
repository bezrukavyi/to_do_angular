FactoryGirl.define do
  factory :comment do
    title FFaker::Job.title
    task

    trait :invalid do
      title nil
    end
  end
end
