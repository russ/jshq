# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :version do
    package_id 1
    number "MyString"
    downloads 1
  end
end
