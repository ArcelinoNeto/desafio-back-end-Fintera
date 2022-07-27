FactoryBot.define do
  factory :entiti_user do
    association :account
    association :user
  end
end
