*** Settings ***
Library  SeleniumLibrary 
Library  String
Library  OperatingSystem    

*** Variables ***
${TITLE}

*** Keywords ***

I drag and drop all templates
    Wait Until Element Is Visible  //h1[contains(text(), 'Create new Retro meeting')]
    ${js}        Get File              dragdrop.js
    Execute Javascript    ${js}; return DragNDrop1("two", "bin");
    Sleep  1s
    Execute Javascript    ${js}; return DragNDrop2("two", "bin");
    Sleep  1s
    Execute Javascript    ${js}; return DragNDrop3("two", "bin");
    Sleep  1s
    Execute Javascript    ${js}; return DragNDrop4("two", "bin");

I reorder templates 
    Scroll Element Into View  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/button
    ${js}        Get File              dragdrop.js
    Execute Javascript    ${js}; return DragNDrop5("two", "bin");
    Sleep  1s
    

templates are present in the droppable area
    Wait Until Element Is Visible  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[4]/div[4]/div[1]
     
the Retro meeting form is displayed
    wait until element is visible  //h1[contains(text(), 'Create new Retro meeting')]

I type <title> in the retro template name field
    Wait Until Element Is Visible  //input[@placeholder="Retro meeting name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    input text  //input[@placeholder="Retro meeting name"]  ${TITLE}

the user ticks on the notes checkbox
    click element  //input[@id="notes"]

the user sets timer for <time> minutes
    [Arguments]  ${time}
    double click element  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[6]/div/div/div/div/div[1]/div[2]/input
    input text  //*[@id="root"]/section/section/main/div[2]/form/div/div[1]/div[6]/div/div/div/div/div[1]/div[2]/input  ${time}

the user selects today`s date
    click element  //input[@id='date']
    Wait Until Element Is Visible  //a[contains(text(), 'Today')]
    click element  //a[contains(text(), 'Today')]

the user selects a later time than the current time
    click element  //input[@id='time']

the user clicks Ok button to save the time
    click element  //a[contains(text(), 'Now')]

I click the [Create] button
    Scroll Element Into View  //button[@type='submit']
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
    wait until element is visible  //div[contains(text(), 'Retro template is required')]

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
