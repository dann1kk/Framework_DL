*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/Log_In/LoggingIn.robot
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

@user tries to send the message
    click element  //span[@aria-label='send']

a warning message is displayed
    wait until page contains element  //div[contains(text(), 'message')]

the message is not sent and displayed in Notes

    wait until page does not contain element  //*[@id="messageList"]/ul/li[1]/div





