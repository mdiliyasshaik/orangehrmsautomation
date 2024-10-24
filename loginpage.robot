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
    Logout the application


Validate Forgot password link

    wait until element is located    ${forgot_password}
    click Forgot your password? link
    wait until element is located    ${var_username}
    Enter Valid Username
    Click reset password
    wait until element is located    ${reset_confirmation}
    validate the confirmation message


*** Keywords ***

Enter the user id and password and click signin
    [Arguments]       ${username}        ${password}
    Input Text        ${var_username}    ${user_name}
    Input Password    ${var_password}    ${password}
    Click Button      ${login_btn}

validate the error message

   sleep     2  #adding sleep just to see the screen
   Element Text Should Be    ${Error_MSG}     ${expected_msg}


click Forgot your password? link

    Click Element    ${forgot_password}

Enter Valid username
    Input Text   ${var_username}     ${forgot_username}

Click reset password

    Click Button      ${reset_btn}


validate the confirmation message

    Element Text Should Be    ${reset_confirmation}     ${reset_confirmation_expected}
    





