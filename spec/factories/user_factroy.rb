FactoryGirl.define do
  factory :user do
    # sequence(:email) { |n| "test#{n}@example.com" }
    email "dup@sina.com.cn"
    password "password"
  end
end
