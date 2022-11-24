*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
I click on Past button
    wait until page contains element  //div[contains(text(), 'Past')]
    Sleep  1s
    click element  //div[contains(text(), 'Past')]

saved retrospectives are displayed in past tab
    wait until page does not contain element  //span[contains(text(), 'Join')]
