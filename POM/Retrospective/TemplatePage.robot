*** Settings ***
Library  SeleniumLibrary
Library  String


*** Keywords ***

I press the Use Template button
    Wait Until Element Is Visible  //div[contains(text(), 'Templates')]
    click element  //div[contains(text(), 'Templates')]
    wait until element is visible  (//span[contains(text(), 'Use')])[2]
    click element  (//span[contains(text(), 'Use')])[2]
