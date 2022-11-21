*** Settings ***
Resource  ../POM/Log_In/LoggingIn.robot

*** Settings ***
Library  SeleniumLibrary
Library  String


*** Keywords ***

I press the Use Template button
    I get redirected to template page
    wait until element is visible  (//span[contains(text(), 'Use')])[2]
    click element  (//span[contains(text(), 'Use')])[2]


I get redirected to template page
    Wait Until Element Is Visible  //div[contains(text(), 'Templates')]
    click element  //div[contains(text(), 'Templates')]

Open and login 2 browsers
    Open Browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  firefox  
    Open Browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  chrome  
    Open Browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  chrome  options= add_argument("--incognito")


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