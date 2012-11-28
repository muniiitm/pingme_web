Given /^i am on the home page$/ do
 '/'
end

Then /^i should all the details$/ do
  assert_match "Welcome aboard", "Welcome aboard"
end
