*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
I press log out button on the left side panel
    wait until element is visible  (//span[contains(text(), 'Open')][1])[1]
    click element  (//span[contains(text(), 'Open')][1])[1]
    Wait Until Element Is Visible  //*[@id="root"]/section/aside/div/ul[2]/li[4]
    Click Element  //*[@id="root"]/section/aside/div/ul[2]/li[4]  

I am logged out and redirected to the main login page
     Wait Until Element Is Visible  id=basic_email
