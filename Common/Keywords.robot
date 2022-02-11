*** Settings ***
Resource  Variables.robot

Library  Browser
Library  DateTime
Library  ../Script/csvLibrary.py
Library  String


*** Keywords ***
Start Test
   New Page  ${mainPageUrl}
   # Open Browser  ${mainPageUrl}
End Test
    Close Browser
# ---------------  REGISTRATION  --------------------------
Select Registration
    [Documentation]  Keyword for select registration tab
    Click  ${myAccountTab}
    Click  ${registration}

Send Empty Registration Form
    [Documentation]  Keyword for send empty data of registration form
    Click  ${continueBtn}

Fill Registration Form
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${phoneNumber}  ${passwd}  ${policy}

    Type Text  ${firstNameField}  ${firstName}
    Type Text  ${lastNameField}  ${lastName}
    Type Text  ${emailField}  ${email}
    Type Text  ${phoneNumberField}  ${phoneNumber}
    Type Text  ${passwordField}  ${passwd}
    Type Text  ${passwordConfirmField}  ${passwd}
    Check Policy Check Box  ${policy}

Check Policy Check Box
    [Documentation]  Keyword for check privace policy by registration
    [Arguments]  ${booleanState}=true
    Run Keyword If  '${booleanState}' == 'false'  Click  ${continueBtn}
    Run Keyword If  '${booleanState}' == 'true'  Set Up Policy

Set Up Policy
    [Documentation]  Keyword for set up privace policy
    Click  ${policyCheckbox}
    Click  ${continueBtn}

Check Registration Message
    [Documentation]  Keyword for check registration and message by type message
    [Arguments]  ${message}  ${status}=error

    Run Keyword If  '${status}' == 'success'  Get Text  ${regMessage}  contains  ${message}
    Run Keyword If  '${status}' == 'error'  Get Text  ${errorMessageField}  contains  ${message}
    Click  ${continueBtnSucceed}


Store Credentials Into CSV
    [Documentation]  Keyword for saving registrated credentials into CSV
    [Arguments]  ${email}  ${passw}  ${file_path}
    overwrite_csv_file  ${file_path}  ${email}  ${passw}


# ---------------  LOGIN  --------------------------
Select Login
    [Documentation]  Keyword for select login tab
    Click  ${myAccountTab}
    Click  ${login}

Login Into Website
   [Documentation]  Keyword for login
   [Arguments]  ${email}  ${passwd}
   Type Text  ${emailField}  ${email}
   Type Text  ${passwordField}  ${passwd}
   Click  ${loginBtn}



#  --------------  SEARCH ITEM  ------------------
Search Item
    [Documentation]  Keyword for search an item
    [Arguments]  ${itemName}
    Type Text  ${searchBarField}  ${itemName}
    Click  ${searchBtn}

Check Searched Item
    [Documentation]  Keyword for check searched item
    [Arguments]  ${itemName}
    ${item} =  Get Text  ${searchedItem}
    ${item} =  Convert To Lowercase  ${item}
    ${itemName} =  Convert To Lowercase  ${itemName}
    Should Be Equal  ${itemName}  ${item}

Add To Cart
    [Documentation]  Keyword for add an item to cart
    Click  ${addToCart}
    Sleep  1s

Check Number Of Products In Cart
    [Documentation]  Keyword for check number of added items in cart
    [Arguments]  ${ItemNumbers}  ${totalPrice}
    ${Cart} =  set variable  ${ItemNumbers} item(s) - ${totalPrice}
    Get Text  ${cartTotal}  contains  ${Cart}


Remove Item From Cart
    [Documentation]  Keyword for removing item from cart
    [Arguments]  ${item}
    Click  ${cartTotal}
    Click  ${viewCart}
    ${productsInCart} =  Get Text  ${itemInCart}
    Should Be Equal  ${item}  ${productsInCart}
    Click  ${cartRemoveBtn}

Check Result Message
    [Documentation]  Keyword for check end message of activity by type message
    [Arguments]  ${message}  ${status}=error

    Run Keyword If  '${status}' == 'success'  Get Text  ${successMessageField}  contains  ${message}
    Run Keyword If  '${status}' == 'empty'  Get Text  ${emptyCartMessage}  contains  ${message}
    Run Keyword If  '${status}' == 'error'  Get Text  ${errorMessageField}  contains  ${message}
    Run Keyword If  '${status}' == 'noProducts'  Get Text  ${noSearchMessage}  contains  ${message}


#  ------------------  REVIEW  ----------------------
Show Item Detail
    [Documentation]  Keyword for show detail of an item
    [Arguments]  ${item}
    Click  ${searchedItem}

Navigate To Review
    [Documentation]  Keyword for show review section of an item
    Click  ${reviewTab}
    

Fill Empty Review Form
    [Documentation]  Keyword for post empty review form
    Click  ${reviewContinueBtn}

Create Review
    [Documentation]  Keyword for create review of selected item
    [Arguments]  ${searchedItemName}  ${name}  ${text}  ${rating}
    Search Item  ${searchedItemName}
    Show Item Detail  ${searchedItemName}
    Navigate To Review
    Fill Review Form  ${name}  ${text}  ${rating}


Fill Review Form
    [Documentation]  Keyword for post filled review form
    [Arguments]  ${name}=n/a  ${text}=n/a  ${rating}=n/a
    Run Keyword If  '${name}' != 'n/a'  Set name  ${name}
    Run Keyword If  '${text}' != 'n/a'  Set text  ${text}
    Run Keyword If  '${rating}' != 'n/a'  Set Rating  ${rating}
    Click  ${reviewContinueBtn}

Set Name
    [Documentation]  Keyword for set review name of review form
    [Arguments]  ${name}
    Type Text  ${reviewerNameField}  ${name}

Set Text
    [Documentation]  Keyword for set review text of review form
    [Arguments]  ${text}
    Type Text  ${reviewertextField}  ${text}

Set Rating
    [Documentation]  Keyword for set review rating of review form
    [Arguments]  ${rating}
    Click  //input[@name="rating"][@value="${rating}"]