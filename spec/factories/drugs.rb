# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drug do
    name "MyString"
    description "MyText"
    drugbankID "MyString"
    pharmGkbID "MyString"
    fdaApproved false
    source "MyString"
  end
end
