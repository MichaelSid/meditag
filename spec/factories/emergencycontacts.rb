# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :emergencycontact do
    firstname "Lucy"
    lastname "Brown"
    relationship "28-04-1988"
    contactnr "01722111222"
    address1 "15"
    address2 "A road"
    town "London"
    county "Sussex"
    country "England"
  end
end


		