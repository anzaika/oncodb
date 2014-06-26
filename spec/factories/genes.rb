# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gene do
    name "MyString"
    source "MyString"
    description "MyText"
    uniprotKB "MyString"
    ensemblID "MyString"
    entrezID "MyString"
    pharmGkbID "MyString"
    drugbankTargetID "MyString"
  end
end
