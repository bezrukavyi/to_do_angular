FactoryGirl.define do
  factory :project do
    title FFaker::Job.title
    completed_at FFaker::Time.date

    trait :with_tasks do
      tasks { create_list(:task, 2) }
    end
  end
end
