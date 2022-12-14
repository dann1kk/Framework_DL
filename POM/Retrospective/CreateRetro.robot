*** Settings ***
Library  SeleniumLibrary 
Library  String
Library  OperatingSystem    
Resource  ../POM/Retrospective/ActivePage.robot
Resource  ../POM/Daily_Meeting/Create_Edit_Daily.robot
*** Variables ***

@{templates}   

*** Keywords ***
I drag and drop all templates
    Wait Until Element Is Visible  //h1[contains(text(), 'Create')]
    Drag And Drop  //div[contains(text(), 'ICE_BREAKING')]  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]
    Sleep  1s
    Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
    Sleep  1s 
    Drag And Drop  //div[contains(text(), 'TEAM_HEALTH_CHECK')]  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
    Sleep  1s
    Execute Javascript  window.scrollTo(112, 150)
    Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
    Sleep  1s 

templates are present in the droppable area
   # fourth element in droppable area
    Wait Until Element Is Visible  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/div/div/div[4]/div/div[1]
     
the Retro meeting form is displayed
    wait until element is visible  //h1[contains(text(), 'Create new Retro meeting')]

the Create meeting form is displayed
    wait until element is visible  //h1[contains(text(), 'Create new')]

I type <title> in the retro template name field
    Wait Until Element Is Visible  //input[@placeholder="Retro template name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    Set Global Variable  ${TITLE} 
    input text  //input[@placeholder="Retro template name"]  ${TITLE}

I type <title> in the retro meeting name field
    Wait Until Element Is Visible  //input[@placeholder="Retro meeting name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    Set Global Variable  ${TITLE} 
    input text  //input[@placeholder="Retro meeting name"]  ${TITLE}

I joined the retrospective meeting
    Sleep  5s
    Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
    IF  "${IsElementVisible}" == "False"
        Click Element  //span[@aria-label="right"]
        Sleep  5s
        Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible1}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
        IF  "${IsElementVisible1}" == "False"
            Wait Until Element is Visible  //span[@aria-label="right"]
            Click Element  //span[@aria-label="right"]
            Sleep  5s
            Wait Until Element Is Visible  //span[@aria-label="right"]
            ${IsElementVisible2}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
            IF  "${IsElementVisible2}" == "False"
                Wait Until Element is Visible  //span[@aria-label="right"]
                Click Element  //span[@aria-label="right"]
                Sleep  5s
                Wait Until Element Is Visible  //span[@aria-label="right"]
                ${IsElementVisible3}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                IF  "${IsElementVisible3}" == "False"
                    Wait Until Element is Visible  //span[@aria-label="right"]
                    Click Element  //span[@aria-label="right"]
                    Sleep  5s
                    Wait Until Element Is Visible  //span[@aria-label="right"]
                    ${IsElementVisible4}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                        IF  "${IsElementVisible4}" == "False"
                        Wait Until Element is Visible  //span[@aria-label="right"]
                        Click Element  //span[@aria-label="right"]
                            Sleep  5s
                            Wait Until Element Is Visible  //span[@aria-label="right"]
                            ${IsElementVisible5}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                            IF  "${IsElementVisible5}" == "False"
                            Wait Until Element is Visible  //span[@aria-label="right"]
                            Click Element  //span[@aria-label="right"]
                            ELSE    
                                Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 
                            END
                        ELSE
                        Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 
                        END
                ELSE
                    Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 
                END
            ELSE 
            Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 
            END
        ELSE  
            Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 
        END
    ELSE 
        Click Element  (//div[.='${TITLE}']/parent::li//button)[1] 
    END

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
    # ${Date_twice}=  Get Element Count  //div[@class='ant-picker-cell-inner'][.='${date}']
    # IF  "${Date_twice}" == "2"
    #     Click Element  (//div[@class='ant-picker-cell-inner'][.='${date}'])[2]
    # ELSE
        Click Element  //div[@class='ant-picker-cell-inner'][.='${date}']
    #END
    
the user selects a later time than the current time
    Wait Until Element Is Visible  //input[@id='time']
    click element  //input[@id='time']    
    click element  //a[contains(text(), 'Now')]
    Click Element  //input[@id='time']
    ${5min_present}=  Get Element Count   (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][5]
    IF  "${5min_present}" == "1"
       Click Element  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][5]
    ELSE 
       Click Element  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][1]
    END
    Click Element  //span[contains(text(), 'OK')]

I click the [Create] button
    Execute Javascript  window.scrollTo(113, 754)
    click element  //button[@type='submit']

I select a time in the past
    Wait Until Element Is Visible  //input[@id='time']
    click element  //input[@id='time']    
    click element  //a[contains(text(), 'Now')]
    Click Element  //input[@id='time']
    Click Element  (//ul[@class="ant-picker-time-panel-column"])[1]//li[@class="ant-picker-time-panel-cell"][1]
    Click Element  //span[contains(text(), 'OK')]
    
the Retro meeting is saved in the active tab
    Sleep  2s
    Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
    IF  "${IsElementVisible}" == "False"
        Click Element  //span[@aria-label="right"]
        Sleep  2s
        Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible1}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
        IF  "${IsElementVisible1}" == "False"
            Click Element  //span[@aria-label="right"]
            Sleep  2s
            Wait Until Element Is Visible  //span[@aria-label="right"]
            ${IsElementVisible2}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
            IF  "${IsElementVisible2}" == "False"
                Click Element  //span[@aria-label="right"]
                Sleep  2s
                ${IsElementVisible3}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                IF  "${IsElementVisible3}" == "False"
                    Click Element  //span[@aria-label="right"]
                    Sleep  2s
                    Wait Until Element Is Visible  //span[@aria-label="right"]
                    ${IsElementVisible4}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                        IF  "${IsElementVisible4}" == "False"
                        Click Element  //span[@aria-label="right"]
                            Sleep  2s
                            Wait Until Element Is Visible  //span[@aria-label="right"]
                            ${IsElementVisible5}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                            IF  "${IsElementVisible5}" == "False"
                            Click Element  //span[@aria-label="right"]
                            ELSE
                                Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]  
                            END
                        ELSE
                         Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]  
                        END
                ELSE
                     Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]  
                END
            ELSE 
             Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]   
            END
        ELSE  
             Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]   
        END
    ELSE 
         Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]   
    END

title is visible 
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
    open browser  ${link}  firefox  options= add_argument("--headless")
    maximize browser window
    

I choose date and time
    click element  //input[@id='date']
    click element  //a[contains(text(), 'Today')]
    scroll element into view  //input[@id='time']
    click element  //input[@id='time']    
    click element  //a[contains(text(), 'Now')]
    # Click Element  //input[@id='time']
    # Click Element  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][1]
    # ${5min_present}=  Get Element Count   (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][5]
    # IF  "${5min_present}" == "1"
    #    Click Element  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][5]
    # ELSE 
    #    Click Element  (//ul[@class="ant-picker-time-panel-column"])[2]//li[@class="ant-picker-time-panel-cell"][1]
    # END
    # Click Element  //span[contains(text(), 'OK')]

retrospective meeting is created
    Sleep  2s
    Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
    IF  "${IsElementVisible}" == "False"
        Click Element  //span[@aria-label="right"]
        Sleep  2s
        Wait Until Element Is Visible  //span[@aria-label="right"]
    ${IsElementVisible1}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
        IF  "${IsElementVisible1}" == "False"
            Click Element  //span[@aria-label="right"]
            Sleep  2s
            Wait Until Element Is Visible  //span[@aria-label="right"]
            ${IsElementVisible2}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
            IF  "${IsElementVisible2}" == "False"
                Click Element  //span[@aria-label="right"]
                Sleep  2s
                Wait Until Element Is Visible  //span[@aria-label="right"]
                ${IsElementVisible3}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                IF  "${IsElementVisible3}" == "False"
                    Click Element  //span[@aria-label="right"]
                    Sleep  2s
                    Wait Until Element Is Visible  //span[@aria-label="right"]
                    ${IsElementVisible4}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                        IF  "${IsElementVisible4}" == "False"
                        Click Element  //span[@aria-label="right"]
                            Sleep  2s
                            Wait Until Element Is Visible  //span[@aria-label="right"]
                            ${IsElementVisible5}=  Run Keyword And Return Status    Element Should Be Visible   //div[contains(text(), '${TITLE}')]
                            IF  "${IsElementVisible5}" == "False"
                            Click Element  //span[@aria-label="right"]
                            ELSE
                                Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]  
                            END
                        ELSE
                         Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]  
                        END
                ELSE
                     Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]  
                END
            ELSE 
             Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]   
            END
        ELSE  
             Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]   
        END
    ELSE 
         Wait Until Element Is Visible  //div[contains(text(), '${TITLE}')]   
    END

I drag <templates> in droppable area
     [Arguments]  ${template1}  ${template2}  ${template3}  ${template4} 
     
     IF  "${template1}" == "AGILE"
        Drag And Drop  //div[contains(text(), 'AGILE')]   //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/p[1]
        Sleep  1s 
    ELSE IF  "${template1}" == "EVENT_ENDING"
        Drag And Drop  //div[contains(text(), 'EVENT_ENDING')]   //span[contains(text(), 'Notes')]
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

a retro template is created
    the user clicks [Create Template] button
    I type <title> in the retro template name field
    the user ticks on the notes checkbox
    I drag and drop all templates
    I select Timer duration hours and minutes  02  45
    I click the [Create] button

a retrospective meeting with notes is created   
    I access retrospective page    AutomationDL - manager1@amdaris.com
    the user clicks [Create Retro] button
    the Retro meeting form is displayed
    I type <title> in the retro meeting name field
    the user ticks on the notes checkbox
    I drag and drop all templates
    I select Timer duration hours and minutes  02  45
    I choose date and time
    I click the [Create] button
    the Retro meeting is saved in the active tab
    user is redirected to the active retro page

the user ticks anonymous checkbox
    Click Element  //input[@id="anonymous"]

an anonymous retro meeting with <templates> is created
    [Arguments]  ${template1}  ${template2}  ${template3}  ${template4}  ${year}  ${month}  ${date}
    And I access retrospective page    AutomationDL - manager1@amdaris.com
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro meeting name field
    And the user ticks anonymous checkbox
    And the user ticks on the notes checkbox
    And I drag <templates> in droppable area  ${template1}  ${template2}  ${template3}  ${template4} 
    And I select Timer duration hours and minutes  02  45
    And the user selects date   ${year}  ${month}  ${date}
    And the user selects a later time than the current time
    And I click the [Create] button
    Then the Retro meeting is saved in the active tab
    And user is redirected to the active retro page

a retro meeting with <templates> is created
    [Arguments]  ${template1}  ${template2}  ${template3}  ${template4}  ${year}  ${month}  ${date}
    And I access retrospective page    AutomationDL - manager1@amdaris.com
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro meeting name field
    And the user ticks on the notes checkbox
    And I drag <templates> in droppable area  ${template1}  ${template2}  ${template3}  ${template4} 
    And I select Timer duration hours and minutes  02  45
    And the user selects date   ${year}  ${month}  ${date}
    And the user selects a later time than the current time
    And I click the [Create] button
    Then user is redirected to the active retro page

a current retro meeting with <templates> is created
    [Arguments]  ${template1}  ${template2}  ${template3}  ${template4} 
    And I access retrospective page    AutomationDL - manager1@amdaris.com
    When the user clicks [Create Retro] button
    And the Retro meeting form is displayed
    And I type <title> in the retro meeting name field
    And the user ticks on the notes checkbox
    And I drag <templates> in droppable area  ${template1}  ${template2}  ${template3}  ${template4} 
    And I select Timer duration hours and minutes  02  45
    And I choose date and time
    And I click the [Create] button
    Then the Retro meeting is saved in the active tab
    And user is redirected to the active retro page

I press 'X' button in the corner of the dropped <templates>
    ${nr_templates}=  Get Element Count  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
    IF  "${nr_templates}" == "1"
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
    ELSE IF  "${nr_templates}" == "2"
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
    ELSE IF  "${nr_templates}" == "3"
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
    ELSE IF  "${nr_templates}" == "4"
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
       Click Element  //span[@class="drag-template_removeTemplateBtn__UUQYu"]
    END

<templates> are removed from the droppable area
    Wait Until Element Is Not Visible  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/div/div/div[1]

warning messages are displayed for event name, time and date
    Wait Until Element Is Visible  (//div[@role='alert'])[3]

the meeting is not created
    Wait Until Element Is Visible  //h1[contains(text(), 'Create new')]
