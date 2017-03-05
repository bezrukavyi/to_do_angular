FactoryGirl.define do
  factory :task do
    title FFaker::Job.title
    completed_at FFaker::Time.date
    checked false
    priority { rand(0..10) }
    project

    trait :checked do
      checked true
    end

    trait :invalid do
      title nil
    end

    trait :with_comments do
      comments { create_list :comment, 2 }
    end
  end
end
