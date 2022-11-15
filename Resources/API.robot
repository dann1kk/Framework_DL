*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary 

*** Variables ***

${link}  https://qa-delivery-toolkit.azurewebsites.net/project/1
${payload_create}  {"id":0,"name":"TestD 22","includeNotes":true,"includeTimer":true,"time":"10:29","date":"2022-09-30","timerDuration":135,"occurrences":["FRI"]}
${payload_update}  {"id":120,"name":"TestDan2","includeNotes":true,"includeTimer":true,"timerDuration":15,"occurrences":["FRI","TUE","WED","THU"],"time":"10:52","date":"2022-09-30"}  
${bearer}   Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtYW5hZ2VyMUBhbWRhcmlzLmNvbSIsImlhdCI6MTY2NDUyMjkxNCwiZXhwIjoxNjY0NjA5MzE0fQ.M0MDJaL4oUKBesh_jqYPf4yofFNYJbVCR7AGQOj4oqaQLr0edYopyL9A3_psaKCxnsYG8BD1--w5WyHTfL0iXA

*** Keywords ***

Create Daily Meeting 
    Create Session  Daily_Session  ${link}

    ${body} =  Create Dictionary   js=${payload_create}

    ${header} =  Create Dictionary  js=${bearer}
    
    ${response} =  POST On Session  Daily_Session   /daily/create    data=${body}  headers=${header}  expected_status=200

    Should Be Equal As Strings    OK    ${response.reason}
  
Edit Daily Meeting 
    Create Session  Daily_Session  ${link}
    
    ${body} =  Create Dictionary  js=${payload_update}

    ${header} =  Create Dictionary  js=${bearer}

    ${response} =  PUT On Session  Daily_Session  /daily/edit/120  data=${body}  headers=${header}  expected_status=200

    Should Be Equal As Strings    OK    ${response.reason}

Delete Daily Meeting
   Create Session  Daily_Session  ${link}
   
   ${header} =  Create Dictionary  js=${bearer}

   ${response} =  DELETE On Session  Daily_Session  /standup/120  headers=${header}  expected_status=200

   Should Be Equal As Strings    OK    ${response.reason}

Join Daily Meeting
   Create Session  Daily_Session  ${link}

   ${header} =  Create Dictionary  js=${bearer}

   ${response} =  GET On Session  Daily_Session  /daily/119   headers= ${header}   
   
*** Test Cases ***

Test Case 1
    Create Daily Meeting

Test Case 2
    Edit Daily Meeting

Test Case 3 
    Delete Daily Meeting

Test Case 4
    Join Daily Meeting
