*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Resource.robot
Documentation  Logging In

*** Variables ***

${manager_email}   manager1@amdaris.com
${manager_password}  amdaris
${staff_email}   staff@amdaris.com
${staff_password}  amdaris

*** Keywords ***
I am logged in as Manager
    Wait Until Element Is Visible  id=basic_email
    click element  id=basic_email
    input text  id=basic_email    ${manager_email}
    click element  id=basic_password
    input text  id=basic_password  ${manager_password}
    click button  Sign in

I am logged in as Staff
    Wait Until Element Is Visible  id=basic_email
    click element  id=basic_email
    input text  id=basic_email  ${staff_email}
    click element  id=basic_password
    input text   id=basic_password  ${staff_password}
    Click Button  Sign in

I am logged in as <User>
    [Arguments]  ${User}
    IF  "${User}" == "Manager"
       I am logged in as Manager
    ELSE IF  "${User}" == "Staff"
       I am logged in as Staff
    END

