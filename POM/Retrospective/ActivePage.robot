*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/ProjectsPage.robot
Resource  ../POM/Log_In/LoggingIn.robot
*** Keywords ***
I access retrospective page
    I press on project  21
    wait until element is visible  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    click element  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    Sleep  2s
    ${popup_visible}=  Get Element Count  //div[@class="feedback-modal_container__ly2We"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@class='ant-modal-close-x']
    END

I joined the retrospective meeting
    Wait Until Element Is Visible  (//span[contains(text(), 'Join')])[2]
    Click Element  (//span[contains(text(), 'Join')])[2]

a staff user joined the same active retrospective meeting
    Open Browser   https://app-toolkit-frontend-qa.azurewebsites.net/project/1648/retro  Firefox  options= add_argument("--incognito")
    Maximize Browser Window
    I am logged in as Staff
    I joined the retrospective meeting

retrospective page is displayed
   wait until element is visible  //h1[contains(text(), 'Retrospective')]
active tab is opened
    wait until page contains element  //div[@aria-selected='true'][.='Active']

active retros are displayed in the active tab
    wait until page contains element  //span[contains(text(), 'Join')]
    
I open create <retro> form
    wait until page contains element  //span[contains(text(), 'Create Retro')]
    click element  //span[contains(text(), 'Create Retro')]

the user clicks [Create Retro] button
    wait until element is visible  //span[contains(text(), 'Create Retro')]
    click element  //span[contains(text(), 'Create Retro')]

the user is in Active tab on <Page> 
    [Arguments]  ${Page} 
    IF  "${Page}" == "Retro"
    I access retrospective page
    ELSE IF  "${Page}" == "Daily"
    I press on project  21
    END
    Sleep  1s
    ${popup_visible}=  Get Element Count  //div[@class="feedback-modal_container__ly2We"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@class='ant-modal-close-x']
    END

the user can see the [Invite] button next to an active event
    Wait Until Element Is Visible  (//Span[contains(text(), 'Invite')])[2]
    
user clicks on [Invite] button
    Click Element  (//Span[contains(text(), 'Invite')])[2]

the user sees a text notification "Copying to clipboard was successful!"
    Wait Until Element Is Visible  //div[contains(text(), 'Copying to clipboard was successful!')]

the user clicks the [Create] button
   Wait Until Element Is Visible  //span[contains(text(), 'Create')]
   Click Element  //span[contains(text(), 'Create')]






