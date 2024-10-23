*** Settings ***
Documentation    To Validate the login Page
Library          SeleniumLibrary
Test Setup       Open the browser and navigate to login page url
Test Teardown    Close Browser Session
Resource         resource.robot

*** Test Cases ***

Validate unsuccessful login

    Enter the user id and password and click signin    ${username}    ${invalid_password}
    wait until element is located    ${error_msg}
    validate the error message

Validate Menu display after successful login

    Enter the user id and password and click signin    ${user_name}    ${valid_password}
    wait until element is located    ${menu_item}


*** Keywords ***

Enter the user id and password and click signin
    [Arguments]       ${username}        ${password}
    Input Text        ${var_username}    ${user_name}
    Input Password    ${var_password}    ${password}
    Click Button      ${LOGIN_BTN}
    
wait until element is located
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    sleep     2     #adding sleep just to see the screen


validate the error message

   sleep     2  #adding sleep just to see the screen
   Element Text Should Be    ${Error_MSG}     ${expected_msg}
