FactoryGirl.define do
  factory :task do
    title FFaker::Job.title
    completed_at FFaker::Time.date
    checked false
    priority { rand(0..10) }

    trait :checked do
      checked true
    end

    trait :with_project do
      project { create :project }
    end
  end
end
