*** Settings ***
Documentation    Tests to verify that functionality of login of
...              website  http://tutorialsninja.com/demo/

Library  SeleniumLibrary
Library  DateTime
Library  ../Script/csvLibrary.py

Resource  ../Common/Keywords.robot
Resource  ../Common/ReadCredentials.robot
Resource  ../Common/Variables.robot

Suite Setup   Start test
Test Teardown  End test

*** Variables ***
${file_path} =  C:\Users\JanHaraktesena\Desktop\TesenaBootcamp3Harak\data\credentials.csv
*** Test Cases ***

001_Login_happy_path
    [Documentation]  Happy path for login
    [Tags]  001_Login_happy_path  Login  positiveScenario  TesenaBootcamp3
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  set variable  abc@test.test
    ${passw} =  set variable  TesenaBootcamp

    Select login
    Login into website   ${email}  ${passw}
    # zde je chyba, jelikoz se nelze zaregistrovat

002_Login_wrong_credentials
    [Documentation]  Test scenario with wrong credentials for login
    [Tags]  002_Login_wrong_credentials  Login  negativeScenario  TesenaBootcamp3
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  set variable  neregistrovanyEmail@test.test
    ${passw} =  set variable  TesenaBootcamp

    Select login
    Login into website   ${email}  ${passw}
    Check result message  Warning: No match for E-Mail Address and/or Password.
