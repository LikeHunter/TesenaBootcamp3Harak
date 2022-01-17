*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Library  ../Script/csvLibrary.py

Resource  ../Common/Keywords.robot
Resource  ../Common/Variables.robot

Suite Setup   Start test
Test Teardown  End test

*** Variables ***
${file_path} =  C:\Users\JanHaraktesena\Desktop\TesenaBootcamp3Harak\data\credentials.csv
*** Test Cases ***
001_Registration_happy_path
    [Documentation]  Happy path for registration
    [Tags]  registrationTC_001  positiveScenario
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =  set variable  ${timestamp}@test.test
    ${passw} =  set variable  TesenaBootcamp

    wait until element is visible  ${myAccountTab}
    click element  ${myAccountTab}
    wait until element is visible    ${registration}
    click element  ${registration}
    Fill registration form   Test  Testerovič  ${email}  ${passw}  TesenaTest  TesenaTest
    click element  ${policyCheckbox}
    click element  ${ContinueBtn}
    wait until page contains  Your Account Has Been Created!
    click element  ${ContinueBtnSucceed}

    ${file_path} =  set variable  data/credentials.csv
    overwrite_csv_file  ${file_path}  ${email}  ${passw}


002_Registration_EmptyForm
    [Documentation]  Negative scenario path for registration - all fields are empty
    [Tags]  registrationTC_002  negativeScenario
    ${email} =  Evaluate  int(round(time.time() * 1000))  time
    wait until element is visible  ${myAccountTab}
    click element  ${myAccountTab}
    wait until element is visible    ${registration}
    click element  ${registration}
    click element  ${ContinueBtn}
    wait until page contains  Warning: You must agree to the Privacy Policy!
    click element  ${ContinueBtnSucceed}

003_Registration_NoPrivacePolicy
    [Documentation]  Happy path for registration
    [Tags]  registrationTC_003  negativeScenario
    ${email} =  Evaluate  int(round(time.time() * 1000))  time
    wait until element is visible  ${myAccountTab}
    click element  ${myAccountTab}
    wait until element is visible    ${registration}
    click element  ${registration}
    Fill registration form   Test  Testerovič  ${email}@test.test  1234567890  TesenaTest  TesenaTest
    click element  ${ContinueBtn}
    wait until page contains  Warning: You must agree to the Privacy Policy!
    click element  ${ContinueBtnSucceed}
