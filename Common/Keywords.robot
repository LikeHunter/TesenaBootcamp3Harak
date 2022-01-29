*** Settings ***
Resource  Variables.robot
Library  ../Script/csvLibrary.py
*** Keywords ***
Start test
    open browser  ${mainPageUrl}  chrome
    Maximize Browser Window
End test
    close browser

Select registration
    [Documentation]  Keyword for fill data of registration form
    wait until element is visible  ${myAccountTab}
    click element  ${myAccountTab}
    wait until element is visible    ${registration}
    click element  ${registration}

Fill registration form
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${phoneNumber}  ${passwd}  ${policy}

    wait until element is visible  ${firstNameField}
    input text  ${firstNameField}  ${firstName}
    input text  ${lastNameField}  ${lastName}
    input text  ${emailField}  ${email}
    input text  ${phoneNumberField}  ${phoneNumber}
    input text  ${passwordField}  ${passwd}
    input text  ${passwordConfirmField}  ${passwd}
    check policy check box  ${policy}

check policy check box
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${booleanState}=true
    run keyword if  '${booleanState}' == 'false'  click element  ${ContinueBtn}
    run keyword if  '${booleanState}' == 'true'  Set up policy

Set up policy
    [Documentation]  Keyword for fill data of registration form
    click element  ${policyCheckbox}
    click element  ${ContinueBtn}

Check registration message
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${message}
    wait until page contains  ${message}
    click element  ${ContinueBtnSucceed}

Store credentials into CSV
    [Arguments]  ${email}  ${passw}  ${file_path}
    overwrite_csv_file  ${file_path}  ${email}  ${passw}