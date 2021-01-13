Feature: Create Homepage
As a member of the BU community
I want to go to the PollUp homepage
So I can get information about BU events

Background:
Given I am on the PollUp Homepage

Scenario: Viewing page content
Then I should see "PollUpBing"
Then I should see the application description
Then I should see "Register or Log In with Github"

Scenario: Clicking on "Register or Log In with Github" for the first time
Then I should see textbox to enter username or email address
And I should see textbox to enter password
And I should see Sign In button

Scenario: Clicking on "Register or Log In with Github"  not for the first time
Then I should see "Welcome back <username>!You have logged in via github"
And I should see "Polls" and some polls to participate in, edit and delete
And I should see Add Poll button
And I should see Log Out button
