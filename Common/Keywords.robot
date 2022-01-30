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
    [Documentation]  Keyword for select registration tab
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
    [Documentation]  Keyword for check privace policy by registration
    [Arguments]  ${booleanState}=true
    run keyword if  '${booleanState}' == 'false'  click element  ${ContinueBtn}
    run keyword if  '${booleanState}' == 'true'  Set up policy

Set up policy
    [Documentation]  Keyword for set up privace policy
    click element  ${policyCheckbox}
    click element  ${ContinueBtn}

Check registration message
    [Documentation]  Keyword for check registration end message
    [Arguments]  ${message}
    wait until page contains  ${message}
    click element  ${ContinueBtnSucceed}

Store credentials into CSV
    [Documentation]  Keyword for saving registrated credentials into CSV
    [Arguments]  ${email}  ${passw}  ${file_path}
    overwrite_csv_file  ${file_path}  ${email}  ${passw}


# ---------------  LOGIN  --------------------------
Select login
    [Documentation]  Keyword for select login tab
    wait until element is visible  ${myAccountTab}
    click element  ${myAccountTab}
    wait until element is visible    ${login}
    click element  ${login}

Login into website
   [Documentation]  Keyword for login
   [Arguments]  ${email}  ${passwd}
   wait until element is visible  ${emailField}
   input text  ${emailField}  ${email}
   input text  ${passwordField}  ${passwd}
   click element  ${loginBtn}

Check result message
    [Documentation]  Keyword for check end message of activity
    [Arguments]  ${message}
    wait until page contains  ${message}



#  --------------  SEARCH ITEM  ------------------
Search item
    [Documentation]  Keyword for search an item
    [Arguments]  ${itemName}
    wait until element is visible  ${searchBarField}
    input text  ${searchBarField}  ${itemName}
    click element  ${SearchBtn}

Check searched item
    [Documentation]  Keyword for check searched item
    [Arguments]  ${itemName}
    ${item} =  Get Text  ${SearchedItem}
    ${item} =  Convert To Lowercase  ${item}
    ${itemName} =  Convert To Lowercase  ${itemName}
    should be equal  ${itemName}  ${item}

Add to cart
    [Documentation]  Keyword for add an item to cart
    click element  ${addToCart}
    sleep  1s

Check number of products in Cart
    [Documentation]  Keyword for check number of added items in cart
    [Arguments]  ${ItemNumbers}  ${totalPrice}
    ${Cart} =  set variable  ${ItemNumbers} item(s) - ${totalPrice}
    ${productsInCart} =  Get Text  ${cartTotal}
    should be equal  ${Cart}  ${productsInCart}

Remove item from cart
    [Documentation]  Keyword for removing item from cart
    [Arguments]  ${item}
    click element  ${cartTotal}
    click element  ${viewCart}
    ${productsInCart} =  Get Text  ${itemInCart}
    should be equal  ${item}  ${productsInCart}
    click element  ${cartRemoveBtn}


#  ------------------  REVIEW  ----------------------

Show item detail
    [Documentation]  Keyword for show detail of an item
    [Arguments]  ${item}
    click element  ${SearchedItem}

Navigate to review
    [Documentation]  Keyword for show review section of an item
    click element  ${reviewTab}
    wait until element is visible  ${reviewerNameField}

Fill empty review form
    [Documentation]  Keyword for post empty review form
    click element  ${reviewContinueBtn}

Fill review form
    [Documentation]  Keyword for post filled review form
    [Arguments]  ${name}=n/a  ${text}=n/a  ${rating}=n/a
    run keyword if  '${name}' != 'n/a'  Set name  ${name}
    run keyword if  '${text}' != 'n/a'  Set text  ${text}
    run keyword if  '${rating}' != 'n/a'  Set rating  ${rating}
    click element  ${reviewContinueBtn}

Set name
    [Documentation]  Keyword for set review name of review form
    [Arguments]  ${name}
    input text  ${reviewerNameField}  ${name}

Set text
    [Documentation]  Keyword for set review text of review form
    [Arguments]  ${text}
    input text  ${reviewertextField}  ${text}

Set rating
    [Documentation]  Keyword for set review rating of review form
    [Arguments]  ${rating}
    click element  //input[@name="rating"][@value="${rating}"]