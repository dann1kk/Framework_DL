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