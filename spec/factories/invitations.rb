# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :invitation do |f|
  f.user_id 1
  f.code "MyString"
  f.email "MyString"
  f.invited_user_id 1
end
