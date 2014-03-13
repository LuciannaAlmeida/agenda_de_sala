# Read about factories at https://github.com/thoughtbot/factory_girl
 
FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "alex#{n}" }
    last_name 'gregianin'
    sequence(:email) { |n| "alex#{n}@example.com" }
    password '12345678'
  end
end