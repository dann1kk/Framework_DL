*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Resource.robot
Documentation  Logging In

*** Variables ***

${manager_email}   manager1@amdaris.com
${manager_password}  amdaris


*** Keywords ***
I am logged in as Manager
    Wait Until Element Is Visible  id=basic_email
    click element  id=basic_email
    input text  id=basic_email    ${manager_email}
    click element  id=basic_password
    input text  id=basic_password  ${manager_password}
    click button  Sign in

Logged in as <User>
   [Arguments]  ${credential_email}  ${credential_password}
    click element  type="email"
    input text  id=basic_email  ${credential_email}
    click element  type="password"
    input text   id=basic_password  ${credential_password}
    click element  Sign in
