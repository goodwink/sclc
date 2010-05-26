Given /^a valid invitation$/ do
  @invitation_code = '34j5v34v5hj34v5h45v'
end

Given /^a logged in user$/ do
  @cucumber_user = User.create!(
    :login_name => login = "cucumber_user",
    :password => pw = "cucumber",
    :password_confirmation => "cucumber",
    :email => "cucumber@notarealemail.not"
  )
  
  visit "/login"
  fill_in("User Name", :with => login)
  fill_in("Password", :with => pw)
  click_button("Login")
  
  page.should have_content("Successfully")
end

When /^I fill in "([^\"]*)" with the valid code$/ do |arg1|
  When 'I fill in "' + arg1 + '" with "' + @invitation_code + '"'
end

When /^I correctly answer the captcha$/ do
  true
end
