*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

I am on TEAM_HEALTH_CHECK 
    [Arguments]   ${link_meeting}
    Open Browser  ${link_meeting}  firefox
    Maximize Browser Window
     
manager clicks reveal results button
    Wait Until Element Is Visible  //span[contains(text(), 'Reveal')]
    Click Element  //span[contains(text(), 'Reveal')]

the Reveal results button is replaced by hide results
    Wait Until Element Is Visible  //span[contains(text(), 'Hide')]

manager clicks hide results button
    Wait Until Element Is Visible  //span[contains(text(), 'Hide')]
    Click Element  //span[contains(text(), 'Hide')]

hide results button is replaced with reveal results button
    Wait Until Element Is Visible  //span[contains(text(), 'Reveal')]

guest users don't see the voting results
    [Arguments]  ${invite_link}
    Open Browser  ${invite_link}  firefox 
    Maximize Browser Window
    Guest user inserts his name
    Wait Until Element Is Visible  //td[contains(text(), 'You')]
    Wait Until Element Is Not Visible  //span[contains(text(), 'R')]

Guest user inserts his name
    Wait Until Element Is Visible  //span[contains(text(), 'Submit')]
    
    Input Text  //input[@autocomplete='name']   Dan
     Click Element  //span[contains(text(), 'Submit')]

I started the meeting
    Wait Until Element Is Visible   //span[contains(text(), 'Start')]


both users clicked on the notes button 
    Switch Browser  1 
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]
    Switch Browser  2
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]

I edit multiple criteria 
    [Arguments]  ${criteria1}  ${criteria2}  ${criteria3}  ${criteria4}  ${criteria5}
    Wait Until Element Is Visible  (//span[@aria-label="edit"])[1]
    Click Element  (//span[@aria-label="edit"])[1] 
    Input Text  (//input[@type="text"])[1]  ${criteria1}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[2] 
    Input Text  (//input[@type="text"])[1]  ${criteria2}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[3]
    Input Text  (//input[@type="text"])[1]  ${criteria3}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[4] 
    Input Text  (//input[@type="text"])[1]  ${criteria4}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[5] 
    Input Text  (//input[@type="text"])[1]  ${criteria5}
    Click Element  //span[@aria-label="check"]

