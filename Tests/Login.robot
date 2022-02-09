*** Settings ***
Documentation    Tests to verify that functionality of login of
...              website  http://tutorialsninja.com/demo/

Resource  ../Common/Keywords.robot
Resource  ../Common/ReadCredentials.robot


Test Setup  Start Test
Test Teardown  End Test

*** Variables ***
${file_path} =  data/credentials.csv
*** Test Cases ***

001_Login_happy_path
    [Documentation]  Happy path for login
    [Tags]  001_Login_happy_path  Login  positiveScenario  TesenaBootcamp3
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  Set Variable  abc@test.test
    ${passw} =  Set Variable  TesenaBootcamp

    Select Login
    Login Into Website   ${email}  ${passw}
    # zde je chyba, jelikoz se nelze zaregistrovat

002_Login_wrong_credentials
    [Documentation]  Test scenario with wrong credentials for login
    [Tags]  002_Login_wrong_credentials  Login  negativeScenario  TesenaBootcamp3
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  Set Variable  neregistrovanyEmail@test.test
    ${passw} =  Set Variable  TesenaBootcamp

    Select Login
    Login Into Website   ${email}  ${passw}
    Check Result Message  Warning: No match for E-Mail Address and/or Password.  error
