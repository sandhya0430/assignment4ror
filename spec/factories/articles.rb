FactoryBot.define do
  factory :article do
    title { 'Sample Article' }
    content { 'Sample Content' }
    association :user
  end
end
