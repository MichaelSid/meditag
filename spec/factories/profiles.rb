# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    firstname "John"
    lastname "Smith"
    dob "28-04-1988"
    contactnr "0800123456"
    address1 "15"
    address2 "A road"
    town "London"
    county "Sussex"
    country "England"
    postcode "sw14g"
    gender "male"
  end
end
