@https://www.pivotaltracker.com/story/show/3633712
Feature: Friend Request
  In order to receive a friend's location updates
  As a subscriber
  I want to ask a publisher for authorization to their location feed

  Scenario:
  Given a logged in user
  When I go to my Friends Page
  And I follow "New subscription"
  And I fill in "Publisher" with "1"
  And I press "Save"
  Then I should see "Subscription request sent!"

