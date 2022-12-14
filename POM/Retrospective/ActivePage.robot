*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/ProjectsPage.robot
Resource  ../POM/Log_In/LoggingIn.robot
Resource  ../POM/Retrospective/CreateRetro.robot
*** Keywords ***
I access retrospective page
    [Arguments]  ${project_name}
    I press on project  ${project_name}
    wait until element is visible  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    click element  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    Sleep  2s
    ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END

I open templates page    
    Wait Until Element Is Visible    //div[contains(text(), 'Templates')]
    Click Element    //div[contains(text(), 'Templates')]

a staff user joined the same active retrospective meeting
    [Arguments]  ${id_project}
    Open Browser   https://app-toolkit-frontend-qa.azurewebsites.net/project/${id_project}/retro  Firefox  options= add_argument("--headless") 
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

the user clicks [Create Template] button
    wait until element is visible  //span[contains(text(), 'Create Template')]
    click element  //span[contains(text(), 'Create Template')]

the user clicks [Create Retro] button
    wait until element is visible  //span[contains(text(), 'Create Retro')]
    click element  //span[contains(text(), 'Create Retro')]

the user is in Active tab on <Page> 
    [Arguments]  ${Page} 
    IF  "${Page}" == "Retro"
    I access retrospective page  AutomationDL - manager1@amdaris.com
    ELSE IF  "${Page}" == "Daily"
    I press on project  AutomationDL - manager1@amdaris.com
    END
    Sleep  1s
     ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
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






