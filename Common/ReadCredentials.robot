*** Settings ***
Resource  Variables.robot
Library  ../Script/csvLibrary.py
*** Keywords ***

Read login credentials
    [Documentation]
    [Arguments]  ${file_path}  ${cust}
    ${data}=  read_csv_file  ${file_path}  ${cust}
    log to console  ${data}
    log  ${data}