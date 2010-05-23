@https://www.pivotaltracker.com/story/show/3633916
Feature: Create Account
  In order to authenticate myself to my friends
  As a publisher or subscriber
  I want to create a system login

  Scenario: New User Signup
  Given I am on the signup page
  And a valid invitation
  When I fill in "Login name" with "First"
  And I fill in "Email" with "FIrst@example.com"
  And I fill in "Password" with "swordfish"
  And I fill in "Password confirmation" with "swordfish"
  And I fill in "Invitation code" with the valid code
  And I correctly answer the captcha
  And I press "Accept"
  Then I should see "Welcome"
