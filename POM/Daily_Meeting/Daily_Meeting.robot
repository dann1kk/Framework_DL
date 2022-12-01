*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/Log_In/LoggingIn.robot
Resource  ../POM/Daily_Meeting/MainPage.robot
*** Variables ***

${manager_email}   manager1@amdaris.com
${manager_password}  amdaris
${staff_email}   staff@amdaris.com
${staff_password}  amdaris

*** Keywords ***
DL joined the daily stand-up meeting as <User>
    [Arguments]  ${User}  ${meeting_link} 
    open browser  ${meeting_link}  firefox
    maximize browser window
    IF  "${User}" == "Manager"
       I am logged in as Manager
    ELSE IF  "${User}" == "Staff"
       I am logged in as Staff
    END


the standup meeting has Notes integrated
    wait until page contains element  //h3[contains(text(), 'Notes')]

@user writes a blank message in the Notes
    Wait Until Element Is Visible  //input[@class="ant-input"]
    input text   //input[@class="ant-input"]    ${SPACE}

@user writes a message in the Notes
    Wait Until Element Is Visible  //input[@class="ant-input"]
    input text   //input[@class="ant-input"]    Howdy

@user tries to send the message
    click element  //span[@aria-label='send']

a warning message is displayed
    wait until page contains element  //div[contains(text(), 'message')]

the message is not sent and displayed in Notes
    wait until page does not contain element  //*[@id="messageList"]/ul/li[1]/div

teams members also joined the meeting
    Open Browser  https://app-toolkit-frontend-qa.azurewebsites.net/project/1648/daily  Chrome
    Maximize Browser Window 
    I am logged in as Staff
    I joined the Daily meeting 
    

teams members are added and displayed on the spinning wheel
    Wait Until Element Is Visible  //div[contains(text(), 'staff')]

manager is not displayed on the spinning wheel
    Wait Until Element Is Not Visible  //div[contains(text(), 'Manager')]

teams members leave the meeting 
    Close Browser

team members are removed from the spinning wheel 
    Switch Browser  1
    Wait Until Element Is Not Visible  //div[contains(text(), 'staff')]

I write a message in notes
    [Arguments]   ${message}
    Switch Browser  1
    Wait Until Element Is Visible  //input[@class="ant-input"]
    input text   //input[@class="ant-input"]    ${message}
    Sleep  1s

the message is sent and displayed in Notes for all users 
    Wait Until Element Is Visible  //*[@id="messageList"]/ul/li[1]/div  
    Switch Browser  2
    Wait Until Element Is Visible  //*[@id="messageList"]/ul/li[1]/div

I write a few messages in notes
    [Arguments]   ${message1}  ${message2}
    Wait Until Element Is Visible  //input[@class="ant-input"]
    input text   //input[@class="ant-input"]    ${message1}
    click element  //span[@aria-label='send']
    Wait Until Element Is Visible  //input[@class="ant-input"]
    input text   //input[@class="ant-input"]    ${message2}
    click element  //span[@aria-label='send']
    Sleep  1s


I end the meeting
    Wait Until Element Is Visible  //span[contains(text(), 'End Meeting')]
    Click Element  //span[contains(text(), 'End Meeting')]

save notes checkbox is ticked
    Click Element  //span[contains(text(), 'OK')]

the meeting notes are saved in Past tab
    Click Element  //div[contains(text(), 'Past')]
    Wait Until Element Is Visible  (//span[contains(text(), 'View')])[2]
    Click Element  (//span[contains(text(), 'View')])[2]
    Wait Until Element Is Visible  //*[@id="messageList"]/ul/li[1]
    Wait Until Element Is Visible  //*[@id="messageList"]/ul/li[2]




    


