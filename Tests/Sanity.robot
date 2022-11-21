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

Documentation  Sanity Tests

Test Setup  Open DL in Firefox
Test Teardown  End Test

*** Variables ***
# link to a working daily with notes integrated
${daily_meeting}  https://app-toolkit-frontend-qa.azurewebsites.net/project/1/daily/99
# link to a templates page with templates created on it
${templates_page}  https://app-toolkit-frontend-qa.azurewebsites.net/project/7/retro?tab=templates
# link to retro meeting with first template team_health_check
${team_health_check_link}



*** Test Cases ***
Test Case - Display active retros in Active tab
    Given I am logged in as Manager
    When I access retrospective page
    Then retrospective page is displayed
    And active tab is opened
    And active retros are displayed in the active tab

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

Test Case - Adding Blank Messages in the Daily Stand-Up Notes - Manager
    [Setup] 
    Given DL joined the daily stand-up meeting as 'Manager'  ${daily_meeting}
    And the standup meeting has Notes integrated
    When @user writes a blank message in the Notes
    And @user tries to send the message
    Then the Send button is disabled - manager
    And the message is not sent and displayed in Notes

Test Case - Adding Blank Messages in the Daily Stand-Up Notes - Staff
    [Setup]
    Given Team Members joined the daily stand-up meeting as 'Staff'  ${daily_meeting}
    And the standup meeting has Notes integrated
    When @user writes a blank message in the Notes
    And @user tries to send the message
    Then the Send button is disabled - staff
    And the message is not sent and displayed in Notes

Test Case - Verify if manager can create and save a retro meeting
    Given I am logged in as Manager
    And I access retrospective page
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro template name field
    And the user ticks on the notes checkbox
    And I drag and drop all templates
    And I reorder templates
    And the user sets timer for <time> minutes  00
    And the user selects today`s date
    And the user selects a later time than the current time
    And the user clicks Ok button to save the time
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
    [Setup]  #give link to a started meeting with first template TEAM_HEALTH_CHECK (and votes (optional))
    Given I am on TEAM_HEALTH_CHECK   ${team_health_check_link}
    When manager clicks reveal results button 
    Then the Reveal results button is replaced by hide results

Test Case - Hide button Functionality 
    [Setup]  #give link to a started meeting with first template TEAM_HEALTH_CHECK (and votes (optional))
    Given I am on TEAM_HEALTH_CHECK   ${team_health_check_link}
    And I am logged in as Manager 
    And manager clicks reveal results button
    When manager clicks hide results button
    Then hide results button is replaced with reveal results button
    # give invite link for guests
    And guest users don't see the voting results  https://app-toolkit-frontend-qa.azurewebsites.net/retro/invite?token=eyJhbGciOiJIUzI1NiJ9.eyJndWVzdF9pbmZvIjoicmV0cm86MTY0ODo5ODQiLCJpYXQiOjE2Njg2Mjk5MzJ9.0dxF3UU7NVmm-Z43GbBPuv79NOJ5MghfBdm-OAw-v8w

Test Case - Check the meeting to be active 
    Given I am logged in as Manager 
    And I am on Daily Stand-Up page 
    And I press Create Daily-Meeting button
    And I type Daily-Meeting title 
    And I choose date and time 
    When I click the [Create] button 
    And I get redirected to the main page
    Then the created meeting is present 
    And [Join] button is enabled
# example multiple users with browsers
Test Case - Test 2 browsers
    [Setup]
    Open and login 2 browsers
    Switch to 1 browser
    Switch to 2 browser
    Click on browser 1

Test Case -  