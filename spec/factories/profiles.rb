# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    firstname "MyString"
    lastname "MyString"
    dob "2014-04-28"
    contactnr "MyString"
    address1 "MyString"
    address2 "MyString"
    town "MyString"
    county "MyString"
    country "MyString"
    postcode "MyString"
    gender "MyString"
  end
end
