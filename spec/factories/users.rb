# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user do |f|
  f.login_name "MyString"
  f.hashed_password "MyString"
  f.salt "MyString"
  f.email "MyString"
end
