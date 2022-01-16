*** Settings ***
Resource  Variables.robot
*** Keywords ***
Start test
    open browser  ${mainPageUrl}  chrome
    Maximize Browser Window
End test
    close browser


Fill registration form
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${phoneNumber}  ${passwd}  ${passwd}
    wait until element is visible  ${firstNameField}
    input text  ${firstNameField}  ${firstName}
    input text  ${lastNameField}  ${lastName}
    input text  ${emailField}  ${email}
    input text  ${phoneNumberField}  ${phoneNumber}
    input text  ${passwordField}  ${passwd}
    input text  ${passwordConfirmField}  ${passwd}



