# Read about factories at https://github.com/thoughtbot/factory_girl
 
FactoryGirl.define do
  factory :user do
    first_name 'alex'
    last_name 'gregianin'
    email 'alex@gmail.com'
    password '12345678'
  end
end