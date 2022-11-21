*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

I press on project  
    [Arguments]   ${nr_project}
    wait until element is visible  (//span[contains(text(), 'Open')][1])[${nr_project}]
    Click Element  (//span[contains(text(), 'Open')][1])[${nr_project}]
