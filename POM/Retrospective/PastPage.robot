*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${TITLE}

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

all participants names are saved anonymously
    Wait Until Element Is Visible  //td[contains(text(), 'Participant')]

I open saved meeting in past retro
    Wait Until Element Is Visible   (//div[.='${TITLE}']/parent::li//button)[1]
    Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 

voted state is saved the past retro meeting
    Wait Until Element Is Visible  (//span[contains(text(), '1')])[2]