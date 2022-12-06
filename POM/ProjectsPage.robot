*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

I press on project  
    [Arguments]   ${project_name}
    wait until element is visible  //div[.="${project_name}"]/parent::div/ul/li/span/button
    Click Element  //div[.="${project_name}"]/parent::div/ul/li/span/button
