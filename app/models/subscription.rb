class Subscription < ActiveRecord::Base
  belongs_to  :subscriber, :class_name => "User"
  belongs_to  :publisher, :class_name => "User"
end
