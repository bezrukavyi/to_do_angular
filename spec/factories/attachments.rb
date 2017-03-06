FactoryGirl.define do
  factory :attachment do
    file { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/files/test.txt") }

    trait :invalid do
      file nil
    end
  end
end
