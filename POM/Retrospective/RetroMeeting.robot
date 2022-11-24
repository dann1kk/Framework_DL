*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${criteria1}
${criteria2}
${criteria3}
${criteria4}
${criteria5}

*** Keywords ***

I am on TEAM_HEALTH_CHECK 
    [Arguments]   ${link_meeting}
    Open Browser  ${link_meeting}  firefox
    Maximize Browser Window
     
manager clicks reveal results button
    Wait Until Element Is Visible  //span[contains(text(), 'Reveal')]
    Click Element  //span[contains(text(), 'Reveal')]

the Reveal results button is replaced by hide results
    Wait Until Element Is Visible  //span[contains(text(), 'Hide')]

manager clicks hide results button
    Wait Until Element Is Visible  //span[contains(text(), 'Hide')]
    Click Element  //span[contains(text(), 'Hide')]

hide results button is replaced with reveal results button
    Wait Until Element Is Visible  //span[contains(text(), 'Reveal')]

guest users don't see the voting results
    [Arguments]  ${invite_link}
    Open Browser  ${invite_link}  firefox 
    Maximize Browser Window
    Guest user inserts his name
    Wait Until Element Is Visible  //td[contains(text(), 'You')]
    Wait Until Element Is Not Visible  //span[contains(text(), 'R')]

Guest user inserts his name
    Wait Until Element Is Visible  //span[contains(text(), 'Submit')]
    
    Input Text  //input[@autocomplete='name']   Dan
     Click Element  //span[contains(text(), 'Submit')]

I started the meeting
    Switch Browser  1
    Wait Until Element Is Visible   //span[contains(text(), 'Start')]
    Click Element  //span[contains(text(), 'Start')]


both users clicked on the notes button 
    Switch Browser  1 
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]
    Switch Browser  2
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]

staff sends a few messages in notes 
    Wait Until Element Is Visible  //input[@id="message"]
    Sleep  1s
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla

    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla2
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla3
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla4
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla5
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla6
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span

the messages are displayed in notes section for manager
    Switch Browser  1
    Wait Until Element Is Visible  //li[@class="chat_messageReceived__i8WCY"]
    Wait Until Element Is Visible  //li[@class="chat_messageReceived__i8WCY"]
    Wait Until Element Is Visible  //li[@class="chat_messageReceived__i8WCY"]
    Wait Until Element Is Visible  //li[@class="chat_messageReceived__i8WCY"]
    Wait Until Element Is Visible  //li[@class="chat_messageReceived__i8WCY"]

staff clicked on the notes button
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]

I clicked on the notes button
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]

manager receives message notification
    Switch Browser  1
    Wait Until Element Is Visible  //figure[@class="windows-chat_notification__KdskE"]

a new message notification is visible
   Wait Until Element Is Visible  //div[@class="chat_messageNotificationButton__HPJI-"]

I edit multiple criteria 
    [Arguments]  ${criteria1}  ${criteria2}  ${criteria3}  ${criteria4}  ${criteria5}
    Set Suite Variable  ${criteria1}
    Set Suite Variable  ${criteria2}
    Set Suite Variable  ${criteria3}
    Set Suite Variable  ${criteria4}
    Set Suite Variable  ${criteria5}
    Wait Until Element Is Visible  (//span[@aria-label="edit"])[1]
    Click Element  (//span[@aria-label="edit"])[1] 
    Input Text  (//input[@type="text"])[1]  ${criteria1}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[2] 
    Input Text  (//input[@type="text"])[1]  ${criteria2}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[3]
    Input Text  (//input[@type="text"])[1]  ${criteria3}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[4] 
    Input Text  (//input[@type="text"])[1]  ${criteria4}
    Click Element  //span[@aria-label="check"]
    Click Element  (//span[@aria-label="edit"])[5] 
    Input Text  (//input[@type="text"])[1]  ${criteria5}
    Click Element  //span[@aria-label="check"]

the new criterias are saved and visible 
    Wait Until Element Is Visible  //span[contains(text(), '${criteria1}')]
    Wait Until Element Is Visible  //span[contains(text(), '${criteria2}')]
    Wait Until Element Is Visible  //span[contains(text(), '${criteria3}')]
    Wait Until Element Is Visible  //span[contains(text(), '${criteria4}')]
    Wait Until Element Is Visible  //span[contains(text(), '${criteria5}')]

I click End 
    Wait Until Element Is Visible  //span[contains(text(),'End')]
    Click Element  //span[contains(text(),'End')]

I <action> notes checkbox
    [Arguments]  ${action}
    IF  "${action}" == "untick"
    Click Element  //input[@type="checkbox"]
    END
I click <Element>
    [Arguments]  ${Element} 
    IF  "${Element}" == "x"
    Click Element  //span[@class='ant-modal-close-x']
    ELSE IF  "${Element}" == "Cancel"
    Click Element  (//button[@class="ant-btn ant-btn-default"])[2]
    ELSE IF  "${Element}" == "Outside"
    Click Element  //div[@class="ant-modal-wrap"]  
    END

the Retro meeting doesn't end 
    Wait Until Element Is Visible  //span[contains(text(),'End')]

I moved to the next template 
    Switch Browser  1
    Wait Until Element Is Visible  //span[contains(text(),'Next')]
    Click Element  //span[contains(text(),'Next')]
    

the Notes window remains opened
    Wait Until Element Is Visible  //div[@id="messageList"]

all participants can write messages in the Notes
    Wait Until Element Is Visible  //input[@id="message"]
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Switch Browser  2
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    