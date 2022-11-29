*** Settings ***
Library  SeleniumLibrary  timeout= 10s
Resource  ../Resources/Resource.robot
Resource  ../POM/Retrospective/ActivePage.robot
Resource  ../POM/Retrospective/PastPage.robot
Resource  ../POM/Retrospective/CreateRetro.robot
Resource  ../POM/Retrospective/TemplatePage.robot
Resource  ../POM/Retrospective/RetroMeeting.robot
Resource  ../POM/Daily_Meeting/Daily_Meeting.robot
Resource  ../POM/Daily_Meeting/MainPage.robot
Resource  ../POM/Log_In/LoggingIn.robot
Resource  ../POM/ProjectsPage.robot
Resource  ../POM/Daily_Meeting/Create_Edit_Daily.robot

Documentation  Sanity Tests

Test Setup  Open DL in Firefox
Test Teardown  End Test

*** Variables ***
# link to a templates page with templates created on it
${templates_page}  https://app-toolkit-frontend-qa.azurewebsites.net/project/7/retro?tab=templates
#give today date
${year}  2022
${month}  Nov
${day}   29
#set as today
${occurence}   Monday
*** Test Cases ***
Test Case - Display active retros in Active tab
    Given I am logged in as Manager
    When I access retrospective page
    Then retrospective page is displayed
    And active tab is opened
 

Test Case - Display saved retros in Past tab
    Given I am logged in as Manager
    And I access retrospective page
    When I click on Past button
    Then saved retrospectives are displayed in past tab

Test Case - Check if all templates can be dragged and dropped in the droppable area
   Given I am logged in as Manager
   And I access retrospective page
   When I open create <retro> form
   And I drag and drop all templates
   Then templates are present in the droppable area

Test Case - Adding Blank Messages in the Daily Stand-Up Notes
    Given I am logged in as <User>  Manager
    And a standup meeting with Notes is created  ${year}  ${month}  ${day}  ${occurence}
    And I joined the Daily meeting 
    When @user writes a blank message in the Notes
    And @user tries to send the message
    Then a warning message is displayed
    And the message is not sent and displayed in Notes

Test Case - Verify if manager can create and save a retro meeting with all templates
    Given I am logged in as Manager
    And I access retrospective page
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro template name field
    And the user ticks on the notes checkbox
    And I drag and drop all templates
    And I select Timer duration hours and minutes  02  45
    And the user selects date  2023  Jul  20
    And the user selects a later time than the current time
    And I click the [Create] button
    Then the Retro meeting is saved in the active tab
    And user is redirected to the active retro page

Test Case - Verify if can save a meeting without adding any templates in the droppable area
    Given I am logged in as Manager
    And I access retrospective page
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And the user left the droppable area empty
    And the user complete all the rest components with valid data
    And I click the [Create] button
    Then an error message near droppable area is displayed
    And the meeting is not saved

Test Case - Verify if user can create retrospective from template
    [Setup] 
    Given I am on the retrospective template page  ${templates_page}
    And I am logged in as Manager
    When I press the Use Template button
    And I type <title> in the retro template name field
    And I choose date and time
    And I click the [Create] button
    Then retrospective meeting is created

Test Case - User is logged out after pressing log out button
    Given I am logged in as Manager
    When I press log out button on the left side panel
    Then I am logged out and redirected to the main login page

Test Case - Reveal button Functionality
    Given I am logged in as Manager
    And a retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -  -  -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    And I started the meeting
    When manager clicks reveal results button 
    Then the Reveal results button is replaced by hide results

Test Case - Hide button Functionality 
    Given I am logged in as Manager
    And a retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -  -  -   ${year}  ${month}  ${day} 
    And I joined the retrospective meeting
    And I started the meeting
    And manager clicks reveal results button
    When manager clicks hide results button
    Then hide results button is replaced with reveal results button
    #  And guest users don't see the voting results  https://app-toolkit-frontend-qa.azurewebsites.net/retro/invite?token=eyJhbGciOiJIUzI1NiJ9.eyJndWVzdF9pbmZvIjoicmV0cm86MTY0ODo5ODQiLCJpYXQiOjE2Njg2Mjk5MzJ9.0dxF3UU7NVmm-Z43GbBPuv79NOJ5MghfBdm-OAw-v8w

Test Case - Check the meeting to be active 
    Given I am logged in as Manager 
    And I am on Daily Stand-Up page 
    And I press Create Daily-Meeting button
    And I type Daily-Meeting title 
    And the user selects date  ${year}  ${month}  ${day} 
    And the user selects a later time than the current time
    When I click the [Create] button 
    And I get redirected to the main page
    Then the created meeting is present 
    And [Join] button is enabled

# example multiple users with browsers
# Test Case - Test 2 browsers
#     [Setup]
#     Open and login 2 browsers
#     Switch to 1 browser
#     Switch to 2 browser
#     Click on browser 1

Test Case - Generate invite link
    Given I am logged in as Manager
    And the user is in Active tab on <Page>  Retro 
    And the user can see the [Invite] button next to an active event
    When user clicks on [Invite] button
    Then the user sees a text notification "Copying to clipboard was successful!"

Test Case - Create One-Time Daily Stand-up meeting
    Given I am logged in as Manager
    And I am on Daily Stand-Up page
    When I press Create Daily-Meeting button 
    And I type Daily-Meeting title
    And I select Timer duration hours and minutes  01  45
    And the user selects date  ${year}  ${month}  ${day}
    And the user selects a later time than the current time
    And I select Occurrence one-time  ${occurence}
    And I click the [Create] button
    Then the created meeting is present

Test Case - Edit Daily Stand-Up meeting
    Given I am logged in as Manager
    And a daily stand-up meeting is created 
    When I click [Edit] button
    And I edit the event name  
    And I untick the Notes and Timer checkboxes
    And I edit the Year, Month and Date  2023  Nov  29
    And the user selects a later time than the current time
    And I edit the Occurrence  Tuesday  Wednesday 
    And I click [Update]
    Then the updated meeting is present


Test Case - Check if users receive notifications when notes window is opened
    Given I am logged in as Manager 
    And a retrospective meeting with notes is created
    And I joined the retrospective meeting
    And a staff user joined the same active retrospective meeting
    And both users clicked on the notes button 
    When staff sends a few messages in notes 
    Then the messages are displayed in notes section for manager
    And a new message notification is visible

Test Case - Check if users receive notifications when notes window is closed
    Given I am logged in as Manager 
    And a retrospective meeting with notes is created
    And I joined the retrospective meeting
    And a staff user joined the same active retrospective meeting
    And staff clicked on the notes button
    When staff sends a few messages in notes 
    Then manager receives message notification

Test Case - Create Retrospective with particular templates
    Given I am logged in as Manager
    And I access retrospective page
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro template name field
    And the user ticks on the notes checkbox
    And I drag <templates> in droppable area  EVENT_ENDING  -  AGILE  - 
    And I select Timer duration hours and minutes  02  45
    And the user selects date  2023  Jul  20
    And the user selects a later time than the current time
    And I click the [Create] button
    Then the Retro meeting is saved in the active tab
    And user is redirected to the active retro page

Test Case - Check if templates can be removed from the droppable area
    Given I am logged in as Manager
    And I access retrospective page
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I drag <templates> in droppable area  EVENT_ENDING  -  AGILE  - 
    When I press 'X' button in the corner of the dropped <templates>
    Then <templates> are removed from the droppable area

Test Case - Verify if user is required to add event name, time and date.
    Given I am logged in as Manager 
    And the user is in Active tab on <Page>  Daily 
    And the user clicks the [Create] button
    And the Create meeting form is displayed
    When I click the [Create] button
    Then warning messages are displayed for event name, time and date
    And the meeting is not created


Test Case - Edit multiple criteria with valid data on TEAM_HEALTH_CHECK
    Given I am logged in as Manager
    And a retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -   -   -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    When I edit multiple criteria  Edit   New   Abab   New Criteria  LorenIpsum 
    Then the new criterias are saved and visible 

Test Case - Team Members are added to the Spinning Wheel upon joining daily
    Given I am logged in as Manager
    And a daily stand-up meeting is created for today
    And I joined the Daily meeting
    When teams members also joined the meeting
    Then teams members are added and displayed on the spinning wheel
    And manager is not displayed on the spinning wheel

Test Case - Team Members are removed from the Spinning Wheel upon leaving daily
    Given I am logged in as Manager
    And a daily stand-up meeting is created for today
    And I joined the Daily meeting
    And teams members also joined the meeting
    When teams members leave the meeting 
    Then team members are removed from the spinning wheel 

Test Case - Writing and sending messages in an active Daily Stand-Up Notes
    Given I am logged in as Manager
    And a daily stand-up meeting is created for today
    And I joined the Daily meeting
    And teams members also joined the meeting
    When I write a message in notes  My message
    And @user tries to send the message
    Then the message is sent and displayed in Notes for all users 

Test Case - Check side nav bar redirection
    Given I am logged in as Manager
    And I am on Daily Stand-Up page
    And side navigation bar is visible
    When I click navigation bar <button>  Retro
    Then the button redirects me to <page>  Retrospective 

Test Case - Delete a Daily Stand-Up meeting
    Given I am logged in as Manager
    And a daily stand-up meeting is created for today
    When I click [Delete] button on Daily meeting
    And I confirm that I want to delete meeting
    Then the meeting is deleted
    And is not saved in past tab

Test Case - Daily meeting Notes are saved in Past tab
    Given I am logged in as Manager
    And a daily stand-up meeting is created for today
    And I joined the Daily meeting
    And I write a few messages in notes  Buna ziua  Buna seara
    When I end the meeting
    And save notes checkbox is ticked
    Then I get redirected to the main page
    And the meeting notes are saved in Past tab

Test Case - Past Daily meeting can be deleted
    Given I am logged in as manager
    And a daily stand-up meeting is created for today
    And I joined the Daily meeting
    And I end the meeting
    And save notes checkbox is ticked
    When I click on Past button
    And I click [Delete] button on Daily meeting
    And I confirm that I want to delete meeting
    Then the meeting is deleted

Test Case - Retro End meeting and cancel
    Given I am logged in as manager
    And a retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -   -   -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    When I started the meeting
    And I click End 
    And I <action> notes checkbox  untick
    And I click <Element>  Cancel 
    Then the Retro meeting doesn't end  

Test Case - Retro Chat notes not closed upon switching template
    Given I am logged in as manager
    And a retrospective meeting with notes is created
    And I joined the retrospective meeting
    And a staff user joined the same active retrospective meeting
    When I started the meeting
    And both users clicked on the notes button 
    And I moved to the next template 
    Then the Notes window remains opened
    And all participants can write messages in the Notes 

Test Case - Check End button functionality - all templates empty
    Given I am logged in as Manager
    And a retrospective meeting with notes is created
    And I joined the retrospective meeting
    When I started the meeting
    And I moved to the last template
    And I click End
    And I confirm that I want to end meeting
    Then the meeting is deleted

Test Case - Check End button functionality - all templates filled
    Given I am logged in as Manager
    And a retrospective meeting with notes is created
    And I joined the retrospective meeting
    And I started the meeting
    When I fill data on all templates
    And I confirm that I want to end meeting
    Then the meeting is deleted

Test Case - Submit the vote with various voting combinations on TEAM_HEALTH_CHECK
    Given I am logged in as Manager
    And a retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -   -   -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    And I started the meeting
    When I submit my <state1> and <state2> in TEAM_HEALTH_CHECK   Normal   Constant
    Then I am redirected to TEAM_HEALTH_CHECK template
    And my votes are saved in the table

Test Case - Voting results are updated in real-life
    Given I am logged in as Manager
    And a retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -   -   -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    And a staff user joined the same active retrospective meeting
    And I started the meeting
    When staff submits <state1> and <state2> in TEAM_HEALTH_CHECK  Normal  Constant
    When I submit my <state1> and <state2> in TEAM_HEALTH_CHECK   Normal   Constant
    Then the voting results are updated in real life for both users

Test Case - Check the voted states in the ice_breaking template in the past retro meeting
    Given I am logged in as Manager
    And a retro meeting with <templates> is created  ICE_BREAKING  -   -   -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    And I started the meeting
    # states come from left to right 1,2,3,4
    When I vote <state> on template  1  
    And I confirm that I want to end meeting
    And I click on Past button
    And I open saved meeting in past retro
    Then voted state is saved the past retro meeting

Test Case - Participants name are saved anonymously in past retro when anonymous participation is on
    Given I am logged in as Manager
    And an anonymous retro meeting with <templates> is created  TEAM_HEALTH_CHECK  -   -   -  ${year}  ${month}  ${day}
    And I joined the retrospective meeting
    And a staff user joined the same active retrospective meeting
    And I started the meeting
    When staff submits <state1> and <state2> in TEAM_HEALTH_CHECK  Normal  Constant
    And I submit my <state1> and <state2> in TEAM_HEALTH_CHECK   Normal   Constant
    And I confirm that I want to end meeting
    And I click on Past button
    And I open saved meeting in past retro
    Then all participants names are saved anonymously
    
