# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    hour '09:00'
    day  'Thu'
    user
  end
end
