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
   Sleep  2s
    ${popup_visible}=  Get Element Count  //div[@class="feedback-modal_container__ly2We"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@class='ant-modal-close-x']
    END
    
I press log out button on the left side panel
    I press on project  1
    Wait Until Element Is Visible  //h1[contains(text(), 'Daily Stand-Up')] 
    Execute Javascript  window.scrollTo(1536, 739)
    I click on logout button

I joined the Daily meeting 
    Sleep  2s
     ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END
    Wait Until Element Is Visible  (//span[contains(text(), 'Join')])[2]
    Click Element  (//span[contains(text(), 'Join')])[2]
    
I click on logout button  
    Scroll Element Into View  //span[@aria-label="logout"]
    Wait Until Element Is Visible  //span[@aria-label="logout"]
    Click Element  //span[@aria-label="logout"]
    
I am logged out and redirected to the main login page
     Wait Until Element Is Visible  id=basic_email


I press Create Daily-Meeting button
    Wait Until Element Is Visible  //span[contains(text(), 'Create Daily-Meeting')]
    Click Element  //span[contains(text(), 'Create Daily-Meeting')]
    
I type Daily-Meeting title 
    Wait Until Element Is Visible  //input[@placeholder="Event name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    Set Global Variable  ${TITLE}
    Input Text  //input[@placeholder="Event name"]   ${TITLE}

I get redirected to the main page
    Sleep  2s
    ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END
    Wait Until Element Is Visible  //h1[contains(text(), 'Daily Stand-Up')]

the created meeting is present 
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]

[Join] button is enabled
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]

side navigation bar is visible
    Wait Until Element Is Visible   //li[@role="menuitem"]

I click navigation bar <button>
    [Arguments]  ${button}
    IF  "${button}" == "Retro"  
        Click Element   (//li[@role="menuitem"])[2]
    ELSE IF  "${button}" == "Daily"
        Click Element   (//li[@role="menuitem"])[1]
    ELSE IF  "${button}" == "Planning"
        Click Element  (//li[@role="menuitem"])[3]
    ELSE IF  "${button}" == "Settings"
        Click Element  (//li[@role="menuitem"])[5]
    ELSE IF  "${button}" == "Feedback"
        Click Element  (//li[@role="menuitem"])[4]
    ELSE IF  "${button}" == "Projects"
        Click Element  (//li[@role="menuitem"])[6]
    END

the button redirects me to <page>
    [Arguments]  ${page}
    IF  "${page}" == "Retro"  
        Wait Until Element Is Visible  //h1[contains(text(), 'Retrospective')]
    ELSE IF  "${page}" == "Daily"
        Wait Until Element Is Visible  //h1[contains(text(), 'Daily')]
    ELSE IF  "${page}" == "Planning"
        Wait Until Element Is Visible  //h1[contains(text(), 'Planning')]
    ELSE IF  "${page}" == "Settings"
        Wait Until Element Is Visible  //h3[contains(text(), 'Estimation')]
    ELSE IF  "${page}" == "Feedback"
        Wait Until Element Is Visible  //h1[contains(text(), 'Feedback')]
    ELSE IF  "${page}" == "Projects"
        Wait Until Element Is Visible  //h1[contains(text(), '')]
    END

I click [Delete] button on Daily meeting
    Wait Until Element Is Visible  (//span[contains(text(), 'Delete')])[2]
    Click Element  (//span[contains(text(), 'Delete')])[2]

the meeting is deleted
    Wait Until Element Is Not Visible  (//h4[@class="ant-list-item-meta-title"])//div[contains(text(), '${TITLE}')]

is not saved in past tab
    Click Element  //div[contains(text(), 'Past')]
    Wait Until Element Is Not Visible   (//h4[@class="ant-list-item-meta-title"])//div[contains(text(), '${TITLE}')]

I confirm that I want to delete meeting
    Click Element  //span[contains(text(), 'OK')]

   