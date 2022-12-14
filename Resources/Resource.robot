*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open DL in Chrome
       open browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  chrome  alias=chrome  options= add_argument("--headless")
       maximize browser window

Open DL in Firefox
       open browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  firefox   options= add_argument("--headless")
       maximize browser window

Open DL in Explorer
       open browser  https://app-toolkit-frontend-qa.azurewebsites.net/project  ie
       maximize browser window

End Test
       close all browsers