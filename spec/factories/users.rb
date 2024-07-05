FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    role { :user }

    trait :editor do
      role { :editor }
    end

    trait :admin do
      role { :admin }
    end
  end
end
