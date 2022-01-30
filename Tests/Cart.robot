*** Settings ***
Documentation    Tests to verify that functionality of cart of
...              website  http://tutorialsninja.com/demo/

Library  SeleniumLibrary
Library  DateTime
Library  ../Script/csvLibrary.py

Resource  ../Common/Keywords.robot
Resource  ../Common/ReadCredentials.robot
Resource  ../Common/Variables.robot

Suite Setup   Start test
Test Teardown  End test

*** Variables ***
${file_path} =  C:\Users\JanHaraktesena\Desktop\TesenaBootcamp3Harak\data\credentials.csv
*** Test Cases ***

001_AddToCartAndClearCart
    [Documentation]  Happy path for search an item,add an item to cart and then clear cart
    [Tags]  001_AddToCartAndClearCart  Cart  positiveScenario  TesenaBootcamp3
    ${searchedItemName} =  set variable  iPhone
    ${productPrice} =  set variable  $123.20

    ${defaultCartProductsnumber} =  set variable  0
    ${defaultCartTotalPrice} =  set variable  $0.00
    Search item  ${searchedItemName}
    Check number of products in Cart  ${defaultCartProductsnumber}  ${defaultCartTotalPrice}
    Add to cart

    Check result message  Success: You have added ${searchedItemName} to your shopping cart!
    ${increasedtCartProductsnumber} =  set variable  1
    Check number of products in Cart  ${increasedtCartProductsnumber}  ${productPrice}

    Remove item from cart   ${searchedItemName}
    Check result message  Your shopping cart is empty!
    Check number of products in Cart  ${defaultCartProductsnumber}  ${defaultCartTotalPrice}



