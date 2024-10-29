*** Settings ***
Documentation    To create Time sheet for current week
Library          SeleniumLibrary
Test Setup       Open the browser and navigate to login page url
Test Teardown    Close Browser Session
Resource         resource.robot
Library          Collections

*** Test Cases ***
Create Time sheet for current week
    Login To Application    ${user_name}     ${valid_password}
    Navigate To Time Sheet under Time Menu
    Create Time sheet for current week
    Submit the time sheet
    Logout the application


*** Keywords ***
Navigate To Time Sheet under Time Menu
    wait until element is located    ${time_menu}
    Click Element    ${time_menu}
    wait until element is located    ${timesheet_dropdown}
    Click Element    ${timesheet_dropdown}
    wait until element is located     ${mytimesheet_option}
    Click Element  ${mytimesheet_option}
    
Create Time sheet for current week
    wait until element is located    ${mytimehssetedit_btn}
    Click Button    ${mytimehssetedit_btn}
    wait until element is located    ${mytimesheettrash_btn}
    Click Element   ${mytimesheettrash_btn}
    Click Element   ${mytimesheettrash_btn}
    Input Text    ${mytimesheetprjt_name}    A
    Sleep   5
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER

    wait until element is located    ${mytimesheet_activity}
    Click Element    ${mytimesheet_activity}
    wait until element is located    ${mytimesheet_activity_option}
    Click Element    ${mytimesheet_activity_option}
    Input Text    ${mytimesheet_Monday}        4
    Input Text    ${mytimesheet_Tuesday}       4
    Input Text    ${mytimesheet_Wednesday}     4
    Input Text    ${mytimesheet_Thursday}      4
    Input Text    ${mytimesheet_Friday}        4
    Click Element    ${mytimesheet_addrow}
    Input Text    ${mytimesheetprjt_name2}    B
    Sleep   5
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER
    wait until element is located    ${mytimesheet_activity2}
    Click Element    ${mytimesheet_activity2}
    wait until element is located    ${mytimesheet_activity_option2}
    Click Element    ${mytimesheet_activity_option2}
    Input Text    ${mytimesheet_Monday2}    4
    Input Text    ${mytimesheet_Tuesday2}    4
    Input Text    ${mytimesheet_Wednesday2}    4
    Input Text    ${mytimesheet_Thursday2}    4
    Input Text    ${mytimesheet_Friday2}    4

Submit the time sheet
    wait until element is located    ${save_btn}
    Click Element    ${save_btn}
    Sleep    5
    ${timesheet_status}=        Get Text        ${mytimesheet_status}
    Log To Console     ${timesheet_status}
    IF    '${timesheet_status}' == "Status: Submitted"
        Log To Console        This week Time sheet updated
    ELSE
    wait until element is located    ${mytimesheey_submitbtn}
    Click Element    ${mytimesheet_submitbtn}
    wait until element is located    ${mytimehssetedit_btn}
    Log To Console        This week Time sheet Submitted
    END
    

