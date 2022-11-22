*** Settings ***
Library  SeleniumLibrary 
Library  String
Library  OperatingSystem    
Resource  ../POM/Retrospective/ActivePage.robot
Resource  ../POM/Daily_Meeting/Create_Edit_Daily.robot
*** Variables ***
${TITLE}

@{templates}   

*** Keywords ***

I drag and drop all templates
    Wait Until Element Is Visible  //h1[contains(text(), 'Create new Retro meeting')]
    Drag And Drop  //div[contains(text(), 'ICE_BREAKING')]  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]
    Sleep  1s
    Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
    Sleep  1s 
    Drag And Drop  //div[contains(text(), 'TEAM_HEALTH_CHECK')]  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
    Sleep  1s
    Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
    Sleep  1s 

templates are present in the droppable area
   # fourth element in droppable area
    Wait Until Element Is Visible  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/div/div/div[4]/div/div[1]
     
the Retro meeting form is displayed
    wait until element is visible  //h1[contains(text(), 'Create new Retro meeting')]

I type <title> in the retro template name field
    Wait Until Element Is Visible  //input[@placeholder="Retro meeting name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    input text  //input[@placeholder="Retro meeting name"]  ${TITLE}

the user ticks on the notes checkbox
    click element  //input[@id="notes"]

the user selects date
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

the user selects a later time than the current time
    click element  //input[@id='time']

the user clicks Ok button to save the time
    click element  //a[contains(text(), 'Now')]

I click the [Create] button
    Execute Javascript  window.scrollTo(113, 754)
    click element  //button[@type='submit']

the Retro meeting is saved in the active tab
    wait until element is visible  //div[contains(text(), '${TITLE}')]

user is redirected to the active retro page
    wait until element is visible  (//div[@aria-selected='true'])

the user left the droppable area empty
     wait until element is visible  //h1[contains(text(), 'Create new Retro meeting')]

the user complete all the rest components with valid data
    Wait Until Element Is Visible  //input[@placeholder="Retro meeting name"]
    input text  //input[@placeholder="Retro meeting name"]  ${TITLE}
    click element  //input[@id='date']
    click element  //a[contains(text(), 'Today')]
    click element  //input[@id='time']
    click element  //a[contains(text(), 'Now')]

an error message near droppable area is displayed
    wait until element is visible  //div[contains(text(), 'At least one retro template is required')]

the meeting is not saved
    wait until element is visible  //h1[contains(text(), 'Create new Retro meeting')]

I am on the retrospective template page
    [Arguments]  ${link}
    open browser  ${link}  firefox
    maximize browser window

I choose date and time
    click element  //input[@id='date']
    click element  //a[contains(text(), 'Today')]
    scroll element into view  //input[@id='time']
    click element  //input[@id='time']    
    click element  //a[contains(text(), 'Now')]

retrospective meeting is created
    wait until element is visible  //div[contains(text(), '${TITLE}')]


I drag <templates> in droppable area
     [Arguments]  ${template1}  ${template2}  ${template3}  ${template4} 
     
     IF  "${template1}" == "AGILE"
        Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template1}" == "EVENT_ENDING"
        Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[3]/div/div
        Sleep  1s 
    ELSE IF  "${template1}" == "TEAM_HEALTH_CHECK"
        Drag And Drop  //div[contains(text(), 'TEAM_HEALTH_CHECK')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[3]/div/div
        Sleep  1s 
     ELSE IF  "${template1}" == "ICE_BREAKING"
        Drag And Drop  //div[contains(text(), 'ICE_BREAKING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    END
    IF  "${template2}" == "AGILE"
        Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template2}" == "EVENT_ENDING"
        Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template2}" == "TEAM_HEALTH_CHECK"
        Drag And Drop  //div[contains(text(), 'TEAM_HEALTH_CHECK')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
     ELSE IF  "${template2}" == "ICE_BREAKING"
        Drag And Drop  //div[contains(text(), 'ICE_BREAKING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    END
    IF  "${template3}" == "AGILE"
        Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template3}" == "EVENT_ENDING"
        Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template3}" == "TEAM_HEALTH_CHECK"
        Drag And Drop  //div[contains(text(), 'TEAM_HEALTH_CHECK')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
     ELSE IF  "${template3}" == "ICE_BREAKING"
        Drag And Drop  //div[contains(text(), 'ICE_BREAKING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    END
    IF  "${template4}" == "AGILE"
        Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template4}" == "EVENT_ENDING"
        Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template4}" == "TEAM_HEALTH_CHECK"
        Drag And Drop  //div[contains(text(), 'TEAM_HEALTH_CHECK')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
     ELSE IF  "${template4}" == "ICE_BREAKING"
        Drag And Drop  //div[contains(text(), 'ICE_BREAKING')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    END

a retrospective meeting with notes is created 
    [Arguments]  ${year}  ${month}  ${day}  
    I access retrospective page
    the user clicks [Create Retro] button
    the Retro meeting form is displayed
    I type <title> in the retro template name field
    the user ticks on the notes checkbox
    I drag and drop all templates
    I select Timer duration hours and minutes  02  45
    the user selects date  ${year}  ${month}  ${day}
    the user selects a later time than the current time
    the user clicks Ok button to save the time
    I click the [Create] button
    the Retro meeting is saved in the active tab
    user is redirected to the active retro page

a retro meeting with <templates> is created
    [Arguments]  ${template1}  ${template2}  ${template3}  ${template4}  
    And I access retrospective page
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro template name field
    And the user ticks on the notes checkbox
    And I drag <templates> in droppable area  ${template1}  ${template2}  ${template3}  ${template4} 
    And I select Timer duration hours and minutes  02  45
    And I choose date and time
    And the user selects a later time than the current time
    And the user clicks Ok button to save the time
    And I click the [Create] button
    Then the Retro meeting is saved in the active tab
    And user is redirected to the active retro page