*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/ProjectsPage.robot
 
*** Keywords ***
I access retrospective page
    I press on project  1
    wait until element is visible  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    click element  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    
retrospective page is displayed
   wait until element is visible  //h1[contains(text(), 'Retrospective')]
active tab is opened
    wait until page contains element  //div[contains(text(), 'Active')]

active retros are displayed in the active tab
    wait until page contains element  //span[contains(text(), 'Join')
    
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

the user can see the [Invite] button next to an active event
    Wait Until Element Is Visible  (//Span[contains(text(), 'Invite')])[2]
    
user clicks on [Invite] button
    Click Element  (//Span[contains(text(), 'Invite')])[2]

the user sees a text notification "Copying to clipboard was successful!"
    Wait Until Element Is Visible  //div[contains(text(), 'Copying to clipboard was successful!')]








