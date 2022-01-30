*** Settings ***
Documentation    Tests to verify that functionality of reviews
...              of an item for website  http://tutorialsninja.com/demo/

Library  SeleniumLibrary
Library  DateTime
Library  ../Script/csvLibrary.py

Resource  ../Common/Keywords.robot
Resource  ../Common/ReadCredentials.robot
Resource  ../Common/Variables.robot

Test Setup  Start test
Test Teardown  End test

*** Variables ***
${file_path} =  C:\Users\JanHaraktesena\Desktop\TesenaBootcamp3Harak\data\credentials.csv

*** Test Cases ***
001_CreateReview_happy_path
    [Documentation]  Happy path for creating review of products
    [Tags]  001_CreateReview_happy_path  Search  positiveScenario  TesenaBootcamp3
    ${searchedItemName} =  set variable  Mac
    ${name} =  set variable  Tesena Test
    ${text} =  set variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  set variable  5
    Create review  ${searchedItemName}  ${name}  ${text}  ${rating}
    Check result message  Thank you for your review. It has been submitted to the webmaster for approval.

002_CreateReview_emptyForm2
    [Documentation]  Negative scenario for posting empty review form
    [Tags]  002_CreateReview_emptyForm  Search  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  set variable  Mac

    Create review  ${searchedItemName}  n/a  n/a  n/a
    Check result message   Warning: Please select a review rating!

003_CreateReview_MandatoryFields_Rating
    [Documentation]  Negative scenario for check mandatory rating field
    [Tags]  003_CreateReview_MandatoryFields_Rating  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  set variable  iPhone
    ${name} =  set variable  Tesena Test
    ${text} =  set variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  set variable  1

    Create review  ${searchedItemName}  ${name}  ${text}  n/a
    Check result message  Warning: Please select a review rating!


004_CreateReview_MandatoryFields_Name
    [Documentation]  Negative scenario for check mandatory name field
    [Tags]  004_CreateReview_MandatoryFields_Name  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  set variable  iPhone
    ${name} =  set variable  Tesena Test
    ${text} =  set variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  set variable  2
    Create review  ${searchedItemName}  n/a  ${text}  ${rating}
    Check result message  Warning: Review Name must be between 3 and 25 characters!

005_CreateReview_MandatoryFields_Text
    [Documentation]  Negative scenario for check mandatory text field
    [Tags]  005_CreateReview_MandatoryFields_Text  Review  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  set variable  iPhone
    ${name} =  set variable  Tesena Test
    ${text} =  set variable  Příliš žluťoučký kůň úpěl ďábelské ódy
    ${rating} =  set variable  3
    Create review  ${searchedItemName}  ${name}  n/a  ${rating}
    Check result message  Warning: Review Text must be between 25 and 1000 characters!