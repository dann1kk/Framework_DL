*** Settings ***
Library  SeleniumLibrary
Library  String 

*** Variables ***
${TITLE}

*** Keywords ***
I press log out button on the left side panel
    wait until element is visible  (//span[contains(text(), 'Open')][1])[1]
    click element  (//span[contains(text(), 'Open')][1])[1]
    Wait Until Element Is Visible  //*[@id="root"]/section/aside/div/ul[2]/li[4]
    Click Element  //*[@id="root"]/section/aside/div/ul[2]/li[4]  

I am logged out and redirected to the main login page
     Wait Until Element Is Visible  id=basic_email


I press Create Daily-Meeting button
    Wait Until Element Is Visible  //span[contains(text(), 'Create Daily-Meeting')]
    Click Element  //span[contains(text(), 'Create Daily-Meeting')]
    
I type Daily-Meeting title 
    Wait Until Element Is Visible  //input[@placeholder="Event name"]
    ${TITLE}=  Generate Random String  10  [LETTERS]
    Input Text  //input[@placeholder="Event name"]   ${TITLE}

I get redirected to the main page
    Wait Until Element Is Visible  //h1[contains(text(), 'Daily Stand-Up')]

the created meeting is present 
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]

[Join] button is enabled
    Wait Until Element Is Visible   //div[contains(text(), '${TITLE}')]
   