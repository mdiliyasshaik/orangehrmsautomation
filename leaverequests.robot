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