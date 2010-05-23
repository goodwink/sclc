Given /^a valid invitation$/ do
  @invitation_code = '34j5v34v5hj34v5h45v'
end

When /^I fill in "([^\"]*)" with the valid code$/ do |arg1|
  When 'I fill in "' + arg1 + '" with "' + @invitation_code + '"'
end

When /^I correctly answer the captcha$/ do
  true
end
