*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided
...              by the imported selenium library
Library          SeleniumLibrary
Library          OperatingSystem

*** Variables ***
${var_username}        //input[@name='username']
${var_password}        //input[@name='password']
${user_name}            Admin
${invalid_password}    1234567
${valid_password}      admin123
${LOGIN_BTN}           //button[@type='submit']
${url}                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${error_msg}           css=.oxd-alert.oxd-alert--error
${expected_msg}        Invalid credentials
${menu_item}           //a[@class='oxd-main-menu-item']
*** Keywords ***
Open the browser and navigate to login page url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To        ${url}
    Wait Until Page Contains Element    ${LOGIN_BTN}
Close Browser Session
    Close Browser