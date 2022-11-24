*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
I click on Past button
    Sleep  2s
    ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END
    wait until page contains element  //div[contains(text(), 'Past')]
    Sleep  1s
    click element  //div[contains(text(), 'Past')]

saved retrospectives are displayed in past tab
    wait until page does not contain element  //span[contains(text(), 'Join')]
