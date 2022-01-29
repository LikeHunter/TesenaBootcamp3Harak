*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  ../Script/csvLibrary.py

Resource  ../Common/Keywords.robot
Resource  ../Common/Variables.robot

Suite Setup   Start test
Test Teardown  End test

*** Variables ***
${file_path} =  data/credentials.csv
*** Test Cases ***
001_Registration_happy_path
    [Documentation]  Happy path for registration
    [Tags]  registrationTC_001  Registration  positiveScenario
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  set variable  ${timestamp}@test.test
    ${passw} =  set variable  TesenaBootcamp

    Select registration
    Fill registration form   Test  Testerovič  ${email}  ${passw}  TesenaTest  true
    Check registration message  Your Account Has Been Created!
    Store credentials into CSV   ${email}  ${passw}  ${file_path}



002_Registration_EmptyForm
    [Documentation]  Negative scenario path for registration - all fields are empty
    [Tags]  registrationTC_002  Registration  negativeScenario
    ${email} =  Evaluate  int(round(time.time() * 1000))  time
    Select registration
    click element  ${ContinueBtn}
    Check registration message  Warning: You must agree to the Privacy Policy!


003_Registration_NoPrivacePolicy
    [Documentation]  Happy path for registration
    [Tags]  registrationTC_003  Registration  negativeScenario

    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  set variable  ${timestamp}@test.test
    ${passw} =  set variable  TesenaBootcamp

    Select registration
    Fill registration form   Test  Testerovič  ${email}  ${passw}  TesenaTest  false
    Check registration message  Warning: You must agree to the Privacy Policy!

