*** Settings ***
Documentation    Tests to verify that functionality of reviews
...              of an item for website  http://tutorialsninja.com/demo/

Resource  ../Common/Keywords.robot

Test Setup  Start Test
Test Teardown  End Test

*** Test Cases ***
001_CreateReview_happy_path
    [Documentation]  Happy path for creating review of products
    [Tags]  001_CreateReview_happy_path  Review  positiveScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  iPhone
    ${name} =  Set Variable  Tesena Test
    ${text} =  Set Variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  Set Variable  5
    Create Review  ${searchedItemName}  ${name}  ${text}  ${rating}
    Check Result Message  Thank you for your review. It has been submitted to the webmaster for approval.  success

002_CreateReview_emptyForm
    [Documentation]  Negative scenario for posting empty review form
    [Tags]  002_CreateReview_emptyForm  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  iPhone

    Create Review  ${searchedItemName}  n/a  n/a  n/a
    Check Result Message   Warning: Please select a review rating!  error

003_CreateReview_MandatoryFields_Rating
    [Documentation]  Negative scenario for check mandatory rating field
    [Tags]  003_CreateReview_MandatoryFields_Rating  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  iPhone
    ${name} =  Set Variable  Tesena Test
    ${text} =  Set Variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  Set Variable  1

    Create Review  ${searchedItemName}  ${name}  ${text}  n/a
    Check Result Message  Warning: Please select a review rating!  error


004_CreateReview_MandatoryFields_Name
    [Documentation]  Negative scenario for check mandatory name field
    [Tags]  004_CreateReview_MandatoryFields_Name  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  iPhone
    ${name} =  Set Variable  Tesena Test
    ${text} =  Set Variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  Set Variable  2
    Create Review  ${searchedItemName}  n/a  ${text}  ${rating}
    Check Result Message  Warning: Review Name must be between 3 and 25 characters!  error

005_CreateReview_MandatoryFields_Text
    [Documentation]  Negative scenario for check mandatory text field
    [Tags]  005_CreateReview_MandatoryFields_Text  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  iPhone
    ${name} =  Set Variable  Tesena Test
    ${text} =  Set Variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  Set Variable  3
    Create Review  ${searchedItemName}  ${name}  n/a  ${rating}
    Check Result Message  Warning: Review Text must be between 25 and 1000 characters!  error