*** Settings ***
Library  SeleniumLibrary
Resource  ../POM/Retrospective/CreateRetro.robot  
Resource  ../POM/Daily_Meeting/MainPage.robot

*** Variables ***
${Result}
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

a daily stand-up meeting is created 
    I am on Daily Stand-Up page
    I press Create Daily-Meeting button 
    I type Daily-Meeting title
    I select Timer duration hours and minutes  01  15
    I edit the Year, Month and Date  2022  Dec  27
    the user selects a later time than the current time
    I select Occurrence one-time  Monday
    I click the [Create] button

a daily stand-up meeting is created for today
    I am on Daily Stand-Up page
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
    ${TITLE}=  Generate Random String  20  [LETTERS][NUMBERS]
    Input Text  //input[@placeholder="Event name"]   ${TITLE}

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
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]

a standup meeting with Notes is created 
    [Arguments]  ${year}  ${month}  ${day}  ${occurence}
    And I am on Daily Stand-Up page
    When I press Create Daily-Meeting button 
    And I type Daily-Meeting title
    And I select Timer duration hours and minutes  01  45
    And the user selects date  ${year}  ${month}  ${day}
    And the user selects a later time than the current time
    And I select Occurrence one-time  ${occurence}
    And I click the [Create] button
    Then the created meeting is present