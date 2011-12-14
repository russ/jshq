# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :package do
    name "MyString"
    slug "MyString"
    downloads 1
  end
end
