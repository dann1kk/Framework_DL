*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
I am on Daily Stand-Up page 
    Wait until element is visible  (//span[contains(text(), 'Open')][1])[1]
    Click Element  (//span[contains(text(), 'Open')][1])[1]
    Wait Until Element Is Visible  //h1[contains(text(), 'Daily Stand-Up')]