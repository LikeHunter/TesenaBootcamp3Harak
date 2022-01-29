*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  ../Script/csvLibrary.py

Resource  ../Common/Keywords.robot
Resource  ../Common/ReadCredentials.robot
Resource  ../Common/Variables.robot

#Suite Setup   Start test
#Test Teardown  End test

*** Variables ***
${file_path} =  C:\Users\JanHaraktesena\Desktop\TesenaBootcamp3Harak\data\credentials.csv
*** Test Cases ***

001_Login_happy_path
    [Documentation]  Happy path for login
    [Tags]  loginTC_001  Login  positiveScenario
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  set variable  abc@test.test
    ${passw} =  set variable  TesenaBootcamp

    Select login
    Login into website   ${email}  ${passw}



