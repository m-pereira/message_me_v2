FactoryBot.define do
  factory :user do
    username { FFaker::Name.name }
    password { "MyString" }
  end
end
