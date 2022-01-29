*** Settings ***
Resource  Variables.robot
Library  ../Script/csvLibrary.py
Library  SeleniumLibrary
Library  String


*** Keywords ***
Start test
    open browser  ${mainPageUrl}  chrome
    Maximize Browser Window
End test
    close browser
# ---------------  REGISTRATION  --------------------------
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


# ---------------  LOGIN  --------------------------
Select login
    [Documentation]  Keyword for fill data of registration form
    wait until element is visible  ${myAccountTab}
    click element  ${myAccountTab}
    wait until element is visible    ${login}
    click element  ${login}

Login into website
   [Arguments]  ${email}  ${passwd}
   wait until element is visible  ${emailField}
   input text  ${emailField}  ${email}
   input text  ${passwordField}  ${passwd}
   click element  ${loginBtn}

Check result message
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${message}
    wait until page contains  ${message}



#  --------------  SEARCH ITEM  ------------------
Search item
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${itemName}
    wait until element is visible  ${searchBarField}
    input text  ${searchBarField}  ${itemName}
    click element  ${SearchBtn}

Check searched item
    [Arguments]  ${itemName}
    ${item} =  Get Text  ${SearchedItem}
    ${item} =  Convert To Lowercase  ${item}
    ${itemName} =  Convert To Lowercase  ${itemName}
    should be equal  ${itemName}  ${item}

Add to cart
    click element  ${addToCart}
    sleep  1s

Check number of products in Cart
    [Arguments]  ${ItemNumbers}  ${totalPrice}
    ${Cart} =  set variable  ${ItemNumbers} item(s) - ${totalPrice}
    ${productsInCart} =  Get Text  ${cartTotal}
    should be equal  ${Cart}  ${productsInCart}

Remove item from cart
    [Arguments]  ${item}
    click element  ${cartTotal}
    click element  ${viewCart}
    ${productsInCart} =  Get Text  ${itemInCart}
    should be equal  ${item}  ${productsInCart}
    click element  ${cartRemoveBtn}
