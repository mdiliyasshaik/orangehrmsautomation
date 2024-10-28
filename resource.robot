*** Settings ***
Documentation    A resource file with reusable keywords and variables
...              The system specific keywords created here from our own
...              domain specific language. They utilize keywords provided
...              by the imported selenium library
Library          SeleniumLibrary
Library          OperatingSystem
Library           ValidateLeaveDate.py


*** Variables ***
${var_username}        //input[@name='username']
${var_password}        //input[@name='password']
${user_name}           Admin
${invalid_password}    1234567
${valid_password}      admin123
${login_btn}           //button[@type='submit']
${url}                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${error_msg}           css=.oxd-alert.oxd-alert--error
${expected_msg}        Invalid credentials
${menu_item}           //a[@class='oxd-main-menu-item']
${forgot_password}    //p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']
${forgot_username}    Admin    # You can adjust this as needed
${reset_btn}          //button[@type='submit']
${reset_confirmation}    //h6
${reset_confirmation_expected}    Reset Password link sent successfully
${logout_dropdown}      //span[@class='oxd-userdropdown-tab']
${logout}              //a[contains(text(),'Logout')]
${admin_menu}          //span[text()='Admin']
${pim_menu}              //span[text()='PIM']
${claim_menu}              //span[text()='Claim']
${leave_menu}              //span[text()='Leave']
${add_btn}                //button[normalize-space()='Add']
${var_newee_name}        //input[@placeholder='Type for hints...']
${var_newuser_name}       (//input[@class='oxd-input oxd-input--active'])[2]
${var_set_pwd}        (//input[@class='oxd-input oxd-input--active'])[3]
${var_confirm_pwd}    (//input[@class='oxd-input oxd-input--active'])[4]
${var_ee_firstname}    //input[@placeholder='First Name']
${var_ee_middlename}    //input[@placeholder='Middle Name']
${var_ee_lastname}    //input[@placeholder='Last Name']
${var_ee_id}           (//input[@class='oxd-input oxd-input--active'])[2]
#${newEEfirstName}        Hello
#${newEEmiddleName}        N
#${newEElastName}        world
${save_btn}            //button[normalize-space()='Save']
${employee_details}    //h6[text()='Personal Details']
${employee_details_expected}     Personal Details
${search_btn}           //button[@type='submit']
${edit_pencil}          css=i.oxd-icon.bi-pencil-fill
${update_middle_name}    No
${search_eeid}           0372
${leave_from}         2024-28-10
${leave_to}           2024-29-10
${apply_leave}       //header/div[2]/nav[1]/ul[1]/li[1]
${leave_list}        //li[@class='oxd-topbar-body-nav-tab --visited']
${leave_apply_btn}    //button[@type='submit']
${leave_type}        //div[@class='oxd-select-text oxd-select-text--active']
${leave_dropdown}    //div[@class='oxd-select-wrapper']
${leave_option}     xpath=(//div[@class='oxd-select-option'])[2]
${eename_input}     //input[@placeholder='Type for hints...']
${assignclaim_btn}   //button[normalize-space()='Assign Claim']
${claim_event}        (//div[@class='oxd-select-text-input'][normalize-space()='-- Select --'])[1]
${claim_currency}    css=div[class='oxd-form-row'] div:nth-child(2) div:nth-child(1) div:nth-child(2) div:nth-child(1) div:nth-child(1) div:nth-child(1)
${claimevent_option}    xpath=(//div[@class='oxd-select-option'])[2]
${claimcurrency_option}    xpath=(//div[@class='oxd-select-option'])[9]
${claim_remarks}        css=.oxd-textarea.oxd-textarea--active.oxd-textarea--resize-vertical
${submit_btn}          //button[@type='submit']
${assign_claim}        //h6[normalize-space()='Assign Claim']
${expenseadd_btn}      (//button[@type='button'][normalize-space()='Add'])[1]
${expense_type}        //div[@class='oxd-select-text-input']
${expense_option}      xpath=(//div[@class='oxd-select-option'])[2]
${expense_date}        //input[@placeholder='yyyy-dd-mm']
${expense_amount}      css=div.oxd-layout.orangehrm-upgrade-layout div.oxd-layout-container div.oxd-layout-context div.orangehrm-background-container div.orangehrm-paper-container div.oxd-overlay.oxd-overlay--flex.oxd-overlay--flex-centered:nth-child(7) div.oxd-dialog-container-default div.oxd-dialog-container-default--inner div.oxd-sheet.oxd-sheet--rounded.oxd-sheet--white.oxd-dialog-sheet.oxd-dialog-sheet--shadow.oxd-dialog-sheet--gutters form.oxd-form div.oxd-form-row:nth-child(2) div.oxd-grid-2.orangehrm-full-width-grid div.oxd-grid-item.oxd-grid-item--gutters:nth-child(2) div.oxd-input-group.oxd-input-field-bottom-space div:nth-child(2) > input.oxd-input.oxd-input--active
${expense_note}        (//textarea[@class='oxd-textarea oxd-textarea--active oxd-textarea--resize-vertical'])[2]
${submitclaim_btn}     //button[normalize-space()='Submit']
${back_btn}            //button[normalize-space()='Back']

*** Keywords ***
Open the browser and navigate to login page url
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To        ${url}
    Wait Until Page Contains Element    ${login_btn}

Login To Application
    [Arguments]    ${username}    ${password}
    Input Text        ${var_username}    ${username}
    Input Password    ${var_password}    ${password}
    Click Button      ${login_btn}

wait until element is located
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    sleep     2     #adding sleep just to see the screen

Close Browser Session
    Close Browser

Logout the application
     Click Element    ${logout_dropdown}
     Click Element     ${logout}
     
Click on Add Button
      Click Element       ${add_btn}

Select the Role of the new user
    [Arguments]  ${set_role}
    Select From List By Value   id=systemUser_userType      ${set_role}

Enter New Employee First Name
    [Arguments]  ${NewEEfirstName}
    Input text  ${var_ee_firstname}    ${NewEEfirstName}

Enter New Employee Middle Name
    [Arguments]  ${NewEEmiddleName}
    Input text  ${var_ee_middlename}      ${NewEEmiddleName}

Enter New Employee Last Name
    [Arguments]  ${NewEElastName}
    Input text  ${var_ee_lastname}      ${NewEElastName}

Enter New Employee Name
    [Arguments]  ${NewEEName}
    Input text  ${var_newee_name}      ${NewEEName}

Enter New User Name
    [Arguments]  ${NewUserName}
    Input text  ${var_newuser_name}      ${NewUserName}

Enter Set Password
    Input text  ${var_set_pwd}      admin123

Enter confirm Password
    Input text  ${var_confirm_pwd}      admin123

Click Save
    Click Button    ${save_btn}

validate employee personal details page

    Element Text Should Be    ${employee_details}     ${employee_details_expected}

validate employee Middle name
    ${updated_name}=    Get Value    ${var_ee_middlename}
    Element Text Should Be    ${updated_name}     ${update_middle_name}

Get Employee ID
    ${employee_id}=    Get Value    ${var_ee_id}
    RETURN    ${employee_id}
     Log To Console    Employee ID: ${employee_id}
     Log               Employee ID: ${employee_id}

Search Employee By ID
    [Arguments]    ${employee_id}
    Input Text    ${var_ee_id}    ${employee_id}    # Replace with actual locator for search by employee ID field
    Click Button    ${search_btn}    # Replace with actual locator for search button
    # Add verification to ensure employee is found (optional)

Update Middle Name
    [Arguments]    ${updatemiddlename}
    Input text  ${var_ee_middlename}      ${update_middle_name}




