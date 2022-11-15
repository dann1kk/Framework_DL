*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
I access retrospective page
    wait until element is visible  (//span[contains(text(), 'Open')][1])[1]
    click element  (//span[contains(text(), 'Open')][1])[1]
    wait until element is visible  //*[@id="root"]/section/aside/div/ul[1]/li[2]
    click element  //*[@id="root"]/section/aside/div/ul[1]/li[2]
retrospective page is displayed
   wait until element is visible  //h1[contains(text(), 'Retrospective')]
active tab is opened
    wait until page contains element  //div[contains(text(), 'Active')]

active retros are displayed in the active tab
    wait until page contains element  //span[contains(text(), 'Join')]

I open create <retro> form
    wait until page contains element  //span[contains(text(), 'Create Retro')]
    click element  //span[contains(text(), 'Create Retro')]

the user clicks [Create Retro] button
    wait until element is visible  //span[contains(text(), 'Create Retro')]
    click element  //span[contains(text(), 'Create Retro')]








