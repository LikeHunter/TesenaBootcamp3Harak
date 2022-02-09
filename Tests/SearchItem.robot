*** Settings ***
Documentation    Tests to verify that functionality of searching
...              an items of website  http://tutorialsninja.com/demo/

Resource  ../Common/Keywords.robot

Test Setup  Start Test
Test Teardown  End Test


*** Test Cases ***
001_SearchItem_happy_path
    [Documentation]  Happy path for login
    [Tags]  001_SearchItem_happy_path  Search  positiveScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  Iphone
    Search Item  ${searchedItemName}
    Check Searched Item  ${searchedItemName}

002_SearchItem_noProducts
    [Documentation]  Test scenario for searching no products
    [Tags]  002_SearchItem_noProducts  Search  negativeScenario  TesenaBootcamp3
    ${searchedItemName} =  Set Variable  yxc
    Search Item  ${searchedItemName}
    Check Result Message  There is no product that matches the search criteria.  noProducts