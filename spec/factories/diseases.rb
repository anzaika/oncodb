# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :disease do
    name "MyString"
    alt_names "MyText"
    source "MyString"
    type 1
    pharmGkbID "MyString"
  end
end
