*** Settings ***
Resource  Variables.robot


Library  Browser
Library  DateTime
Library  ../Script/csvLibrary.py
Library  String


*** Keywords ***
Start test
   New page  ${mainPageUrl}

End test
    close browser
# ---------------  REGISTRATION  --------------------------
Select registration
    [Documentation]  Keyword for select registration tab
    click  ${myAccountTab}
    click  ${registration}

Send empty registration form
    [Documentation]  Keyword for send empty data of registration form
    click  ${ContinueBtn}

Fill registration form
    [Documentation]  Keyword for fill data of registration form
    [Arguments]  ${firstName}  ${lastName}  ${email}  ${phoneNumber}  ${passwd}  ${policy}

    type Text  ${firstNameField}  ${firstName}
    type Text  ${lastNameField}  ${lastName}
    type Text  ${emailField}  ${email}
    type Text  ${phoneNumberField}  ${phoneNumber}
    type Text  ${passwordField}  ${passwd}
    type Text  ${passwordConfirmField}  ${passwd}
    Check policy check box  ${policy}

Check policy check box
    [Documentation]  Keyword for check privace policy by registration
    [Arguments]  ${booleanState}=true
    run keyword if  '${booleanState}' == 'false'  click  ${ContinueBtn}
    run keyword if  '${booleanState}' == 'true'  Set up policy

Set up policy
    [Documentation]  Keyword for set up privace policy
    click  ${policyCheckbox}
    click  ${ContinueBtn}

Check registration message
    [Documentation]  Keyword for check registration and message by type message
    [Arguments]  ${message}  ${status}=error

    run keyword if  '${status}' == 'success'  get text  ${regMessage}  contains  ${message}
    run keyword if  '${status}' == 'error'  get text  ${errorMessageField}  contains  ${message}
    click  ${ContinueBtnSucceed}


Store credentials into CSV
    [Documentation]  Keyword for saving registrated credentials into CSV
    [Arguments]  ${email}  ${passw}  ${file_path}
    overwrite_csv_file  ${file_path}  ${email}  ${passw}


# ---------------  LOGIN  --------------------------
Select login
    [Documentation]  Keyword for select login tab
    click  ${myAccountTab}
    click  ${login}

Login into website
   [Documentation]  Keyword for login
   [Arguments]  ${email}  ${passwd}
   type Text  ${emailField}  ${email}
   type Text  ${passwordField}  ${passwd}
   click  ${loginBtn}



#  --------------  SEARCH ITEM  ------------------
Search item
    [Documentation]  Keyword for search an item
    [Arguments]  ${itemName}
    type Text  ${searchBarField}  ${itemName}
    click  ${SearchBtn}

Check searched item
    [Documentation]  Keyword for check searched item
    [Arguments]  ${itemName}
    ${item} =  Get Text  ${SearchedItem}
    ${item} =  Convert To Lowercase  ${item}
    ${itemName} =  Convert To Lowercase  ${itemName}
    should be equal  ${itemName}  ${item}

Add to cart
    [Documentation]  Keyword for add an item to cart
    click  ${addToCart}
    sleep  1s

Check number of products in Cart
    [Documentation]  Keyword for check number of added items in cart
    [Arguments]  ${ItemNumbers}  ${totalPrice}
    ${Cart} =  set variable  ${ItemNumbers} item(s) - ${totalPrice}
     get text  ${cartTotal}  contains  ${Cart}


Remove item from cart
    [Documentation]  Keyword for removing item from cart
    [Arguments]  ${item}
    click  ${cartTotal}
    click  ${viewCart}
    ${productsInCart} =  Get Text  ${itemInCart}
    should be equal  ${item}  ${productsInCart}
    click  ${cartRemoveBtn}

Check result message
    [Documentation]  Keyword for check end message of activity by type message
    [Arguments]  ${message}  ${status}=error

    run keyword if  '${status}' == 'success'  get text  ${successMessageField}  contains  ${message}
    run keyword if  '${status}' == 'empty'  get text  ${emptyCartMessage}  contains  ${message}
    run keyword if  '${status}' == 'error'  get text  ${errorMessageField}  contains  ${message}
    run keyword if  '${status}' == 'noProducts'  get text  ${noSearchMessage}  contains  ${message}

#  ------------------  REVIEW  ----------------------

Show item detail
    [Documentation]  Keyword for show detail of an item
    [Arguments]  ${item}
    click  ${SearchedItem}

Navigate to review
    [Documentation]  Keyword for show review section of an item
    click  ${reviewTab}
    

Fill empty review form
    [Documentation]  Keyword for post empty review form
    click  ${reviewContinueBtn}

Create review
    [Documentation]  Keyword for create review of selected item
    [Arguments]  ${searchedItemName}  ${name}  ${text}  ${rating}
    Search item  ${searchedItemName}
    Show item detail  ${searchedItemName}
    Navigate to review
    Fill review form  ${name}  ${text}  ${rating}


Fill review form
    [Documentation]  Keyword for post filled review form
    [Arguments]  ${name}=n/a  ${text}=n/a  ${rating}=n/a
    run keyword if  '${name}' != 'n/a'  Set name  ${name}
    run keyword if  '${text}' != 'n/a'  Set text  ${text}
    run keyword if  '${rating}' != 'n/a'  Set rating  ${rating}
    click  ${reviewContinueBtn}

Set name
    [Documentation]  Keyword for set review name of review form
    [Arguments]  ${name}
    type Text  ${reviewerNameField}  ${name}

Set text
    [Documentation]  Keyword for set review text of review form
    [Arguments]  ${text}
    type Text  ${reviewertextField}  ${text}

Set rating
    [Documentation]  Keyword for set review rating of review form
    [Arguments]  ${rating}
    click  //input[@name="rating"][@value="${rating}"]