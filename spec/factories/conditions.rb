# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :condition do
    condition "Cancer"
    notes "not so good"
  end

  factory :asthma, class: :condition do 
    condition 'Asthma'
    notes "Can't breath"
  end
end
