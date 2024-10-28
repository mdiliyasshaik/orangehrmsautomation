*** Settings ***
Documentation    To create claim and add expenses
Library          SeleniumLibrary
Test Setup       Open the browser and navigate to login page url
Test Teardown    Close Browser Session
Resource         resource.robot
Library          Collections



*** Test Cases ***
Create a claim for an employee
    Login To Application    ${user_name}     ${valid_password}
    Navigate To Claim Menu
    Create Claim
    Add Expenses
    Submit the Claim
    Logout the application

*** Keywords ***
Navigate To Claim Menu
    wait until element is located    ${claim_menu}
    Click Element    ${claim_menu}
    wait until element is located    ${assignclaim_btn}
    Click Element    ${assignclaim_btn}
    
Create Claim
    wait until element is located    ${eename_input}
    Input Text    ${eename_input}    A
    Sleep   5
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER
    Click Element    ${claim_event}
    wait until element is located    ${claimevent_option}
    Click Element    ${claimevent_option}
    Sleep    5
    wait until element is located    ${claim_currency}
    Click Element    ${claim_currency}
    wait until element is located  ${claimcurrency_option}
    Click Element    ${claimcurrency_option}
    Input Text    ${claim_remarks}    This is test claim
    Click Button    ${submit_btn}
    Sleep    2

Add Expenses
    wait until element is located    ${assign_claim}
    Click Button    ${expenseadd_btn}
    Sleep    2
    Click Element    ${expense_type}
    wait until element is located    ${expense_option}
    Click Element    ${expense_option}
    Input Text    ${expense_date}    2024-26-10
    wait until element is located    ${expense_amount}
    Input Text    ${expense_amount}   500
    Input Text    ${expense_note}    This is Note for expense
    Click Button  ${submit_btn}
    Sleep    5

    

Submit the Claim
    wait until element is located    ${submitclaim_btn}
    Click Button  ${submitclaim_btn}
    Sleep    5
    Wait Until Element Is Not Visible    ${submitclaim_btn}
    Log To Console    Claim created Successfully
    #Click Button

