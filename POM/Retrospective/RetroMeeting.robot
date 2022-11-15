*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

I am on TEAM_HEALTH_CHECK 
    [Arguments]   ${link_meeting}
    Open Browser  ${link_meeting}  firefox
    Maximize Browser Window
     
manager clicks reveal results button
    Wait Until Element Is Visible  //span[contains(text(), 'Start')]
    Click Element  //span[contains(text(), 'Start')]
    Click Element  //span[contains(text(), 'Reveal')]

the Reveal results button is replaced by hide results
    Wait Until Element Is Visible  //span[contains(text(), 'Hide')]