# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :search do
    keywords "MyString"
    gene false
    drug false
    disease false
    gene_fields "MyString"
    drug_fields "MyString"
    disease_fields "MyString"
  end
end
