*** Settings ***
Documentation    To add/modify new users
Library          SeleniumLibrary
Test Setup       Open the browser and navigate to login page url
Test Teardown    Close Browser Session
Resource         resource.robot

*** Test Cases ***
Add New User

    Login To Application    ${user_name}     ${valid_password}
    wait until element is located    ${pim_menu}
    Click Element    ${pim_menu}
    wait until element is located    ${add_btn}
    Click on Add Button
    wait until element is located    ${var_ee_firstname}
    Enter New Employee First Name  Hellos
    Enter New Employee Middle Name  N
    Enter New Employee Last Name  Worlds
    ${employee_id}=    Get Employee ID    # Get the employee ID after saving
    Click Save
    sleep     5
    wait until element is located    ${employee_details}
    validate employee personal details page
    Logout the application
    

Modify New user

    Login To Application    ${user_name}     ${valid_password}
    wait until element is located    ${pim_menu}
    Click Element    ${pim_menu}
    wait until element is located    ${var_ee_id}
    Search Employee By ID    ${search_eeid}
    wait until element is located    ${edit_pencil}
    Click Element    ${edit_pencil}
    wait until element is located    ${employee_details}
    Clear Element Text    ${var_ee_middlename}
    Update Middle Name   ${update_middle_name}
    Click Save
    Sleep    5
    wait until element is located    ${employee_details}
    Logout the application
    
    
    

