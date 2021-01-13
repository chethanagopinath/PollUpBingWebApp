=begin
Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
=end


=begin
Then /^I should see the application description$/ do
  text = "PollupBing is a webpage that shows all the events which are about to take place in Binghamton University. Users can register for events and participate in the poll questions and can ask questions regarding events. Results of the poll questions are posted when a user makes a choice."   
  step %Q{I should see "#{text}"}
end
=end
=begin
Given /^I am on the PollUp Homepage$/ do 
   text = "PollUp Homepage"   
  step %Q{I should see "#{text}"}
end
=end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see \"([^\"]*)\"$/ do
   text = "PollupBing"   
  step %Q{I should see "#{text}"}
end

Then /^I should see the application description$/ do 
  text = "PollupBing is a webpage that shows all the events which are about to take place in Binghamton University. Users can register for events and participate in the poll questions and can ask questions regarding events. Results of the poll questions are posted when a user makes a choice."      
  step %Q{I should see "#{text}"}
end
=begin
When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end
=end

Then("I should see textbox to enter username or email address") do
  text = "textbox to enter username or email address"   
  step %Q{I should see "#{text}"}
end

And /^I should see textbox to enter password$/ do 
    text = "textbox to enter password"   
  step %Q{I should see "#{text}"}
end

Then("I should see Sign In button") do
  text = "Sign In button"   
  step %Q{I should see "#{text}"}
end

And /^I should see \"([^\"]*)\" and some polls to participate in, edit and delete$/ do |polls|
    text = "some polls to participate in, edit and delete"   
  step %Q{I should see "#{text}"}
end

And /^I should see Add Poll button$/ do 
    text = "Add Poll button"   
  step %Q{I should see "#{text}"}
end

And /^I should see Log Out button$/ do 
    text = "Log Out button"   
  step %Q{I should see "#{text}"}
end
