*** Settings ***
Documentation    Tests to verify that functionality of registration of
...              website  http://tutorialsninja.com/demo/

Resource  ../Common/Keywords.robot

Test Setup  Start Test
Test Teardown  End Test

*** Variables ***
${file_path} =  data/credentials.csv
*** Test Cases ***
001_Registration_happy_path
    [Documentation]  Happy path for registration
    [Tags]  001_Registration_happy_path  Registration  positiveScenario  TesenaBootcamp3
    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =   Set Variable  ${timestamp}@test.test
    ${passw} =   Set Variable  TesenaBootcamp

    Select Registration
    Fill Registration Form   Test  Testerovič  ${email}  ${passw}  TesenaTest  true
    Check Registration Message  Your Account Has Been Created!  success
    Store Credentials Into CSV  ${email}  ${passw}  ${file_path}



002_Registration_EmptyForm
    [Documentation]  Negative scenario path for registration - all fields are empty
    [Tags]  002_Registration_EmptyForm  Registration  negativeScenario  TesenaBootcamp3
    ${email} =  Evaluate  int(round(time.time() * 1000))  time
    Select Registration
    Send Empty Registration Form
    Check Registration Message  Warning: You must agree to the Privacy Policy!  error


003_Registration_NoPrivacePolicy
    [Documentation]  Negative scenario check mandatory field privace policy
    [Tags]  003_Registration_NoPrivacePolicy  Registration  negativeScenario  TesenaBootcamp3

    ${timestamp} =  Evaluate  int(round(time.time() * 1000))  time
    ${timestamp} =  Convert To String  ${timestamp}
    ${email} =   Set Variable  ${timestamp}@test.test
    ${passw} =   Set Variable  TesenaBootcamp

    Select Registration
    Fill Registration Form   Test  Testerovič  ${email}  ${passw}  TesenaTest  false
    Check Registration Message  Warning: You must agree to the Privacy Policy!  error

