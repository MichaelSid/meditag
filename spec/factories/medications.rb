# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medication do
    medication "MyString"
    dose "MyText"
  end

  factory :pulmecort, class: :medication do
    medication "Pulmecort"
    dose "2mg"
    emergency true
  end
end
