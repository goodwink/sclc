# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :subscription do |f|
  f.publisher_id 1
  f.subscriber_id 1
  f.expires_at "2010-05-29 13:38:16"
end
