FactoryBot.define do
  factory :message do
    body { "MyText" }
    user
  end
end
