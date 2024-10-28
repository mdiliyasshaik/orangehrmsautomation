*** Settings ***
Documentation    To Validate the Leaves
Library          SeleniumLibrary
Test Setup       Open the browser and navigate to login page url
Test Teardown    Close Browser Session
Resource         resource.robot

*** Test Cases ***

Apply Leave for Specified Dates
    [Documentation]    Test to apply leave on 26-10-2024
    Login To Application    ${user_name}     ${valid_password}
    Navigate To Leave Menu
    Apply Leave
    Logout the application

*** Keywords ***

Navigate To Leave Menu
    wait until element is located    ${leave_menu}
    Click Element    ${leave_menu}

Apply Leave
    wait until element is located      ${apply_leave}
    Click Element    ${apply_leave}
    #wait until element is located      ${leave_apply_btn}
    Wait Until Element Is Visible    ${leave_dropdown}    timeout=5s
    Click Element    ${leave_dropdown}
    Sleep    2
    Wait Until Element Is Visible    ${leave_option}    timeout=5s
    Click Element    ${leave_option}
    Input Text    (//input[@placeholder='yyyy-dd-mm'])[1]    ${leave_from}
    #Input Text    (//input[@placeholder='yyyy-dd-mm'])[2]    ${leave_to}
    Input Text    css=.oxd-textarea.oxd-textarea--active.oxd-textarea--resize-vertical    Personal Leave
    Click Element    ${leave_apply_btn}
    Sleep    10

Validate Leave request
    wait until element is located      ${leave_list}
    Click Element    ${leave_list}
    sleep     10
    ${is_leave_found}=    Validate Leave Date Exists    ${leave_from}
    Should Be True    ${is_leave_found}    Leave applied on     ${leave_from}     should be present in the list