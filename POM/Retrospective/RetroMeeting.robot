*** Settings ***
Library  SeleniumLibrary
Library  String
*** Variables ***
${criteria1}
${criteria2}
${criteria3}
${criteria4}
${criteria5}
@{list_states}  Normal  
${message1}
${message2}
${message3}
${message4}
${message5}
${message6}
${message7}  
${message8} 

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

  [Arguments]  ${message1}  ${message2}  ${message3}  ${message4}  ${message5}  ${message6}
    Set Global Variable  ${message1}
    Set Global Variable  ${message2}
    Set Global Variable  ${message3}
    Set Global Variable  ${message4}
    Set Global Variable  ${message5}
    Set Global Variable  ${message6}

    Wait Until Element Is Visible  //input[@id="message"]
    Sleep  1s
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message1}

    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message2}
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message3}
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message4}
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message5}
    Sleep  1s
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message6}
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
    Switch Browser  2
    Wait Until Element Is Visible  //figure[@class="windows-chat_icon__Z4aj6"]
    Click Element  //figure[@class="windows-chat_icon__Z4aj6"]

I clicked on the notes button
    Switch Browser  1
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
    Switch Browser  1
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
    Sleep  1s
    Wait Until Element Is Visible  //input[@id="message"]
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Switch Browser  2
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  blabla
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span

I confirm that I want to end meeting
    Click Element  //span[contains(text(), 'OK')]
    
I moved to the last template
    Wait Until Element Is Visible  //span[contains(text(),'Next')]
    Click Element  //span[contains(text(),'Next')]
    Wait Until Element Is Visible  //span[contains(text(),'Next')]
    Click Element  //span[contains(text(),'Next')]
     Wait Until Element Is Visible  //span[contains(text(),'Next')]
    Click Element  //span[contains(text(),'Next')]
    
I fill data on all templates
    I vote <state> on template  1
    I moved to the next template 
    I write a message in AGILE <column>  Start  Don't skip offline meetings
    I submit my <state1> and <state2> in TEAM_HEALTH_CHECK   Normal   Constant
    I moved to the next template
    I vote <state> on template  2
    I click End

I vote <state> on template
    [Arguments]  ${state}
    Sleep  2s
    ${which_template}=  Get Element Count  (//span[@aria-label="like"])[1]
    ${thc}=  Get Element Count   //span[contains(text(),'+')]
    IF  "${which_template}" == "0"
        I write a message in AGILE <column>  START  Norocele
    ELSE IF  "${thc}" == "1"
        I submit my <state1> and <state2> in TEAM_HEALTH_CHECK  Normal  Constant
    ELSE
        IF  "${state}" == "1"
       Click Element  (//span[@aria-label="like"])[1]
    ELSE IF  "${state}" == "2"
       Click Element  (//span[@aria-label="like"])[2]
    ELSE IF  "${state}" == "3"
       Click Element  (//span[@aria-label="like"])[3]
    ELSE IF  "${state}" == "4"
       Click Element  (//span[@aria-label="like"])[4]
       END
       Sleep  1s
    #    ${end}=  Get Element Count  //span[contains(text(),'End')]
    #    IF  "${end}" == "1"
    #           Click Element  //span[contains(text(),'End')]
    #    ELSE  
    #        Click Element  //span[contains(text(),'Next')]
    #     END
    END
I write a message in AGILE <column>
    [Arguments]  ${column}  ${message}
    Sleep  2s
    ${which_template}=  Get Element Count  (//span[@aria-label="like"])[1]
    ${thc}=  Get Element Count   //span[contains(text(),'+')]
    IF  "${which_template}" == "1"
        I vote <state> on template  1
    ELSE IF  "${thc}" == "1"
        I submit my <state1> and <state2> in TEAM_HEALTH_CHECK  Normal  Constant
    ELSE
         ${id_column}=  Convert To Upper Case  ${column}
        Wait Until Element Is Visible  //input[@id="${id_column}"]
        Input Text  //input[@id="${id_column}"]  ${message}
        IF  "${id_column}" == "START"
            Click Element  (//span[@aria-label="send"])[1]
        ELSE IF  "${id_column}" == "STOP"
            Click Element  (//span[@aria-label="send"])[2]
        ELSE IF  "${id_column}" == "CONTINUE"
            Click Element  (//span[@aria-label="send"])[3]
        END
        Sleep  1s
        ${end}=  Get Element Count  //span[contains(text(),'End')]
        IF  "${end}" == "1"
              Click Element  //span[contains(text(),'End')]
        ELSE  
           Click Element  //span[contains(text(),'Next')]
        END
    END

I submit my <state1> and <state2> in TEAM_HEALTH_CHECK
    [Arguments]  ${state1}  ${state2}
    Switch Browser  1
    Sleep  2s
    ${which_template}=  Get Element Count  //span[contains(text(),'+')]
    ${agile}=  Get Element Count  (//span[@aria-label="like"])[1]
    IF  "${which_template}" == "0"
         I vote <state> on template  2
    ELSE IF  "${agile}" == "1"
        I write a message in AGILE <column>  Start  Haide wai
    ELSE 
        Wait Until Element Is Visible  //span[contains(text(),'+')]
        Click Element   //span[contains(text(),'+')]
        Wait Until Element Is Visible  //button[contains(text(),'Normal')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Submit')]
        Sleep  1s
        ${end}=  Get Element Count  //span[contains(text(),'End')]
        IF  "${end}" == "1"
              manager clicks reveal results button
              Click Element  //span[contains(text(),'End')]
        ELSE  
           Click Element  //span[contains(text(),'Next')]
        END
    END

I am redirected to TEAM_HEALTH_CHECK template
       Wait Until Element Is Visible  //td[contains(text(), 'TEAM HEALTH CRITERIA')]

my votes are saved in the table
       Wait Until Element Is Visible  (//div[@class="average-score_chart__IMOey"])[5]

staff submits <state1> and <state2> in TEAM_HEALTH_CHECK
     [Arguments]  ${state1}  ${state2}
     Switch Browser  2
     Wait Until Element Is Visible  //span[contains(text(),'+')]
        Click Element   //span[contains(text(),'+')]
        Wait Until Element Is Visible  //button[contains(text(),'Normal')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Next')]
        Click Element  //button[contains(text(),'${state1}')]
        Click Element  //button[contains(text(),'${state2}')]
        Click Element  //button[contains(text(),'Submit')]
    
the voting results are updated in real life for both users
    Switch Browser  2
    Wait Until Element Is Visible  (//td)[18]

# I vote random 
#     ${list states}=  put all states and choose random between them  // to do later 
#     Wait Until Element Is Visible  //span[contains(text(),'+')]
#         Click Element   //span[contains(text(),'+')]
#         Wait Until Element Is Visible  //button[contains(text(),'Normal')]
#         Click Element  //button[contains(text(),'${state1}')]
#         Click Element  //button[contains(text(),'${state2}')]
#         Click Element  //button[contains(text(),'Next')]
#         Click Element  //button[contains(text(),'${state1}')]
#         Click Element  //button[contains(text(),'${state2}')]
#         Click Element  //button[contains(text(),'Next')]
#         Click Element  //button[contains(text(),'${state1}')]
#         Click Element  //button[contains(text(),'${state2}')]
#         Click Element  //button[contains(text(),'Next')]
#         Click Element  //button[contains(text(),'${state1}')]
#         Click Element  //button[contains(text(),'${state2}')]
#         Click Element  //button[contains(text(),'Next')]
#         Click Element  //button[contains(text(),'${state1}')]
#         Click Element  //button[contains(text(),'${state2}')]
#         Click Element  //button[contains(text(),'Submit')]

the notes are displayed 
  Wait Until Element Is Visible  //p[contains(text(), "${message1}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message2}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message3}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message4}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message5}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message6}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message7}")]
  Wait Until Element Is Visible  //p[contains(text(), "${message8}")]

the notes are in correct order
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[1]  ${message1}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[2]  ${message2}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[3]  ${message3}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[4]  ${message4}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[5]  ${message5}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[6]  ${message6}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[7]  ${message7}
  Element Text Should Be  (//p[@class="chat_textLine__G7BiS"])[8]  ${message8}

I send a few messages
  [Arguments]  ${message7}  ${message8} 
    Set Global Variable  ${message7}
    Set Global Variable  ${message8}

    Wait Until Element Is Visible  //input[@id="message"]
    Sleep  1s
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message7}
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Click Element  //input[@id="message"]  
    Input Text  //input[@id="message"]  ${message8}
    Click Element  //*[@id="root"]/section/section/main/div[3]/div/form/div/div/div/div/span/span/button/span
    Sleep  1s

my vote is canceled 
    Wait Until Element Is Visible  (//span[contains(text(), '0')])[4]
  