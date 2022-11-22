*** Settings ***
Library  SeleniumLibrary
Library  String 
Resource  ../POM/ProjectsPage.robot

*** Variables ***
${TITLE}

*** Keywords ***

I am on Daily Stand-Up page
   I press on project  21
   Wait Until Element Is Visible  //h1[contains(text(), 'Daily Stand-Up')] 

I press log out button on the left side panel
    I press on project  1
    I click on logout button

I joined the Daily meeting 
    Wait Until Element Is Visible  (//span[contains(text(), 'Join')])[2]
    Click Element  (//span[contains(text(), 'Join')])[2]
    
I click on logout button 
    Wait Until Element Is Visible  //li[@data-menu-id="rc-menu-uuid-03014-2-logout"]
    Scroll Element Into View  //li[@data-menu-id="rc-menu-uuid-03014-2-logout"]
    Click Element  //li[@data-menu-id="rc-menu-uuid-03014-2-logout"]
    
I am logged out and redirected to the main login page
     Wait Until Element Is Visible  id=basic_email


I press Create Daily-Meeting button
    Wait Until Element Is Visible  //span[contains(text(), 'Create Daily-Meeting')]
    Click Element  //span[contains(text(), 'Create Daily-Meeting')]
    
I type Daily-Meeting title 
    Wait Until Element Is Visible  //input[@placeholder="Event name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    Input Text  //input[@placeholder="Event name"]   ${TITLE}

I get redirected to the main page
    Wait Until Element Is Visible  //h1[contains(text(), 'Daily Stand-Up')]

the created meeting is present 
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]

[Join] button is enabled
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]
   