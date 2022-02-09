*** Settings ***
Documentation    Tests to verify that functionality of cart of
...              website  http://tutorialsninja.com/demo/

Resource  ../Common/Keywords.robot

Test Setup  Start Test
Test Teardown  End Test


*** Test Cases ***
001_AddToCartAndClearCart
    [Documentation]  Happy path for search an item,add an item to cart and then clear cart
    [Tags]  001_AddToCartAndClearCart  Cart  positiveScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  iPhone
    ${productPrice} =  Set Variable  $123.20

    ${defaultCartProductsnumber} =  Set Variable  0
    ${defaultCartTotalPrice} =  Set Variable  $0.00
    Search Item  ${searchedItemName}
    Check Number Of Products In Cart  ${defaultCartProductsnumber}  ${defaultCartTotalPrice}
    Add To Cart

    Check Result Message  Success: You have added ${searchedItemName} to your shopping cart!  success
    ${increasedtCartProductsnumber} =  Set Variable  1
    Check Number Of Products In Cart  ${increasedtCartProductsnumber}  ${productPrice}

    Remove Item From Cart  ${searchedItemName}
    Check Result Message  Your shopping cart is empty!  empty
    Check Number Of Products In Cart  ${defaultCartProductsnumber}  ${defaultCartTotalPrice}



