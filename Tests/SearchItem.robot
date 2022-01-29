*** Settings ***
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

001_SearchItem_happy_path
    [Documentation]  Happy path for login
    [Tags]  001_SearchItem_happy_path  Search  positiveScenario
    ${searchedItemName} =  set variable  Iphone
    Search item  ${searchedItemName}
    Check searched item  ${searchedItemName}

002_SearchItem_noProducts
    [Documentation]  Happy path for searched no products
    [Tags]  002_SearchItem_noProducts  Search  positiveScenario
    ${searchedItemName} =  set variable  monitor
    Search item  ${searchedItemName}
    Check result message  There is no product that matches the search criteria.