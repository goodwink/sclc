@https://www.pivotaltracker.com/story/show/3633944
Feature: Create Invitation
  In order to invite my friends
  As a subscriber or publisher
  I want to generate an invitation

  Scenario: Generate Invitations
  Given a logged in user
  When I go to my Invitation Page
  And I fill in "Email" with "test@test.com"
  And I press "Invite"
  Then I should see "You have sent an invitation!"
