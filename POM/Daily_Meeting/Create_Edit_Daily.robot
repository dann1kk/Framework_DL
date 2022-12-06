*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/Retrospective/CreateRetro.robot  
Resource  ../POM/Daily_Meeting/MainPage.robot

*** Variables ***
${Result}
${TITLE2}
*** Keywords ***

I select Timer duration hours and minutes  
    [Arguments]  ${hours}  ${minutes}
    Execute Javascript  window.scrollTo(1536, 739)
    Sleep  1s
    Double Click Element  (//input[@maxlength='2'])[1]
    Input Text  (//input[@maxlength='2'])[1]  ${hours}  
    Double Click Element  (//input[@maxlength='2'])[2]
    Input Text  (//input[@maxlength='2'])[2]  ${minutes}

Scroll timer into view
    Scroll Element Into View  (//input[@maxlength='2'])[1]

I select Occurrence one-time  
    [Arguments]  ${day}
    Click Element  //div[@class='ant-select-selector']
    Wait Until Element Is Visible  (//div[.='${day}'])[1]
    Click Element  (//div[.='${day}'])[1]
    Click Element  //input[@placeholder="Event name"]

a daily stand-up meeting without occurence is created 
    [Arguments]  ${year}  ${month}  ${day}
    And I am on Daily Stand-Up page  AutomationDL - manager1@amdaris.com
    When I press Create Daily-Meeting button 
    And I type Daily-Meeting title
    And I select Timer duration hours and minutes  01  45
    And the user selects date  ${year}  ${month}  ${day}
    And the user selects a later time than the current time
    And I click the [Create] button
    Then the created meeting is present
    ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END

a future daily stand-up meeting without occurence is created 
    [Arguments]  ${year}  ${month}  ${day}
    And I am on Daily Stand-Up page    AutomationDL - manager1@amdaris.com
    When I press Create Daily-Meeting button 
    And I type Daily-Meeting title
    And I select Timer duration hours and minutes  01  45
    And the user selects date  ${year}  ${month}  ${day}
    And the user selects a later time than the current time
    And I click the [Create] button
    Then the created meeting is present
    ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END
    
a daily stand-up meeting is created 
    I am on Daily Stand-Up page    AutomationDL - manager1@amdaris.com
    I press Create Daily-Meeting button 
    I type Daily-Meeting title
    I select Timer duration hours and minutes  01  15
    I edit the Year, Month and Date  2022  Dec  25
    the user selects a later time than the current time
    I select Occurrence one-time  Monday
    I click the [Create] button
    Sleep  2s
    ${popup_visible}=  Get Element Count  //div[@class="ant-modal-content"]
    IF  "${popup_visible}" == "1"
       Click Element  //span[@aria-label="close"]
    END

I select the current hour
    Click Element  (//ul[@class="ant-picker-time-panel-column"])[1]//li[@class="ant-picker-time-panel-cell ant-picker-time-panel-cell-selected"][1]

minute options are displayed only for the minutes left of this hour
    Wait Until Element Is Visible  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell ant-picker-time-panel-cell-selected"][1]

a daily stand-up meeting is created for today
    I am on Daily Stand-Up page    AutomationDL - manager1@amdaris.com
    I press Create Daily-Meeting button 
    I type Daily-Meeting title
    I select Timer duration hours and minutes  01  15
    I choose date and time
    I click the [Create] button

I click [Edit] button
    Wait Until Element Is Visible  (//span[.='Edit'])[2]
    Click Element  (//span[.='Edit'])[2]

I edit the event name
     Wait Until Element Is Visible  //input[@placeholder="Event name"]
    ${TITLE2}=  Generate Random String  20  [LETTERS][NUMBERS]
    Set Suite Variable  ${TITLE2}
    Input Text  //input[@placeholder="Event name"]   ${TITLE2}

I untick the Notes and Timer checkboxes
    Click Element  //input[@id='notes']
    Click Element  (//input[@type='checkbox'])[2]

I edit the Year, Month and Date 
    [Arguments]  ${year}  ${month}  ${date}
    Click Element  //input[@id='date']
    Click Element  //button[@class='ant-picker-year-btn']
    ${Result}=  Get Element Count  //div[@class='ant-picker-cell-inner'][.='${year}']
    IF  "${Result}" == "1"
    Click Element  //div[@class='ant-picker-cell-inner'][.='${year}']
    ELSE 
    Click Element  //span[@class='ant-picker-super-next-icon'] 
    Click Element  //div[@class='ant-picker-cell-inner'][.='${year}']
    END

    Click Element  //button[@class='ant-picker-month-btn']
    Click Element  //div[@class='ant-picker-cell-inner'][.='${month}']
    Click Element  //div[@class='ant-picker-cell-inner'][.='${date}']

    
I edit the Occurrence    
    [Arguments]  ${day1}  ${day2}
    Click Element  //div[@class='ant-select-selector']
    Wait Until Element Is Visible  (//div[.='${day1}'])[1]
    Click Element  (//div[.='${day1}'])[1]
    Click Element  (//div[.='${day2}'])[1]
    Click Element  //input[@placeholder="Event name"] 

I click [Update]
    Click Element  //button[.='Update']

the updated meeting is present 
    Sleep  2s
    Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE2}')]
    IF  "${IsElementVisible}" == "False"
        Click Element  //span[@aria-label="right"]
        Sleep  2s
        Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible1}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE2}')]
        IF  "${IsElementVisible1}" == "False"
            Click Element  //span[@aria-label="right"]
            Sleep  2s
            Wait Until Element Is Visible  //span[@aria-label="right"]
            ${IsElementVisible2}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE2}')]
            IF  "${IsElementVisible2}" == "False"
                Click Element  //span[@aria-label="right"]
                Sleep  2s
                Wait Until Element Is Visible  //span[@aria-label="right"]
                ${IsElementVisible3}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE2}')]
                IF  "${IsElementVisible3}" == "False"
                    Click Element  //span[@aria-label="right"]
                    Sleep  2s
                    Wait Until Element Is Visible  //span[@aria-label="right"]
                    ${IsElementVisible4}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE2}')]
                        IF  "${IsElementVisible4}" == "False"
                        Click Element  //span[@aria-label="right"]
                            Sleep  2s
                            Wait Until Element Is Visible  //span[@aria-label="right"]
                            ${IsElementVisible5}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE2}')]
                            IF  "${IsElementVisible5}" == "False"
                            Click Element  //span[@aria-label="right"]
                            ELSE
                                Wait Until Element Is Visible  //div[contains(text(), '${TITLE2}')]  
                            END
                        ELSE
                         Wait Until Element Is Visible  //div[contains(text(), '${TITLE2}')]  
                        END
                ELSE
                     Wait Until Element Is Visible  //div[contains(text(), '${TITLE2}')]  
                END
            ELSE 
             Wait Until Element Is Visible  //div[contains(text(), '${TITLE2}')]   
            END
        ELSE  
             Wait Until Element Is Visible  //div[contains(text(), '${TITLE2}')]   
        END
    ELSE 
         Wait Until Element Is Visible  //div[contains(text(), '${TITLE2}')]   
    END


a standup meeting with Notes is created 
    [Arguments]  ${year}  ${month}  ${day}  ${occurence}
    And I am on Daily Stand-Up page    AutomationDL - manager1@amdaris.com
    When I press Create Daily-Meeting button 
    And I type Daily-Meeting title
    And I select Timer duration hours and minutes  01  45
    And the user selects date  ${year}  ${month}  ${day}
    And the user selects a later time than the current time
    And I select Occurrence one-time  ${occurence}
    And I click the [Create] button
    Then the created meeting is present

I select current time
    Wait Until Element Is Visible  //input[@id='time']   
    click element  //input[@id='time']    
    click element  //a[contains(text(), 'Now')]

I click on [Time] field
    Wait Until Element Is Visible  //input[@id='time'] 
    click element  //input[@id='time'] 

all hour options are displayed and clickable
    Click element  (//ul[@class="ant-picker-time-panel-column"])[1]//li[@class="ant-picker-time-panel-cell"][1]

all minute options are displayed and clickable
    Click element  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][2]

I remove occurence
    Wait Until Element Is Visible  //span[@class="ant-select-selection-item-remove"]
    Click Element  //span[@class="ant-select-selection-item-remove"]

I select +1 hour
    Wait Until Element Is Visible  (//ul[@class="ant-picker-time-panel-column"])[1]//li[@class="ant-picker-time-panel-cell"][1]

the Time input is removed
    Wait Until Element Is Visible  //input[@title=""]  #locator for empty text in field
