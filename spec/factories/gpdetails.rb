# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gpdetail do
  	firstname "Hannibal"
    lastname "Lecter"
    faxnumber "28-04-1988"
    contactnr "0800123456"
    address1 "15"
    address2 "A road"
    town "London"
    county "Sussex"
    country "England"
  end
end
