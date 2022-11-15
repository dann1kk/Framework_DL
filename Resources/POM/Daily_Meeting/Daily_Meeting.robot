*** Settings ***
Library  SeleniumLibrary

*** Variables ***

${manager_email}   manager1@amdaris.com
${manager_password}  amdaris
${staff_email}   staff@amdaris.com
${staff_password}  amdaris
*** Keywords ***
DL joined the daily stand-up meeting as 'Manager'
    [Arguments]  ${meeting_link}
    open browser  ${meeting_link}  firefox
    maximize browser window
    click element  id=basic_email
    input text  id=basic_email    ${manager_email}
    click element  id=basic_password
    input text  id=basic_password  ${manager_password}
    click button  Sign in

the standup meeting has Notes integrated
    wait until page contains element  //h3[contains(text(), 'Notes')]

@user writes a blank message in the Notes
    input text   //input[@class="ant-input"]    ${SPACE}

@user tries to send the message
    click element  //*[@id="root"]/section/section/main/div[2]/div[2]/form/span/span/button
the Send button is disabled - manager
    wait until page contains element  (//button[@disabled = ""])[3]
the message is not sent and displayed in Notes
    wait until page does not contain element  //*[@id="messageList"]/ul/li[1]/div

the Send button is disabled - staff
    wait until page contains element  //button[@disabled = ""]

Team Members joined the daily stand-up meeting as 'Staff'
     [Arguments]  ${meeting_link}
     open browser  ${meeting_link}  firefox
     maximize browser window
     click element  id=basic_email
     input text  id=basic_email    ${staff_email}
     click element  id=basic_password
     input text  id=basic_password  ${staff_password}
     click button  Sign in





