*** Settings ***
Resource  ../POM/Log_In/LoggingIn.robot

*** Settings ***
Library  SeleniumLibrary
Library  String


*** Keywords ***

I press the Use Template button
    Wait Until Element Is Visible  //div[contains(text(), 'Templates')]
    click element  //div[contains(text(), 'Templates')]
    wait until element is visible  (//span[contains(text(), 'Use')])[2]
    click element  (//span[contains(text(), 'Use')])[2]


Open and login 2 browsers
    Open Browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  firefox  
    Open Browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  chrome 

Switch to 1 browser
    Switch Browser  1 
    I am logged in as Manager 

Switch to 2 browser
    Switch Browser  2
    I am logged in as Manager

Click on browser 1
    Switch Browser  1
    Wait Until Element Is Visible  (//span[contains(text(), 'Open')][1])[1]
    Click Element  (//span[contains(text(), 'Open')][1])[1]