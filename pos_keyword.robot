*** Settings ***
Resource          common_variables.robot

Library           Selenium2Library
Library           BuiltIn


*** Keywords ***
Open browser POS
    Open Browser        ${URL}          browser=chrome
    Set Window Size     1600            900
    Wait Until Page Contains             เข้าสู่ระบบ

Login with username "${username}"
    ${password}=    Set Variable If         '${username}'=='cat'    password
    Wait Until Keyword Succeeds     5s      0.2s    Input Text          username        ${username}
    Wait Until Keyword Succeeds     5s      0.2s    Input Text          password        ${password}
    Wait Until Keyword Succeeds     5s      0.2s    Click Button        btnLogin
    Wait Until Page Contains        หน้าหลัก

Fill in username ${username}
    Wait Until Element Is Visible       username
    Input Text                          username    ${username}

Fill in password ${password}
    Wait Until Element Is Visible       password
    Input Password                      password    ${password}

Click login button
    Wait Until Element Is Visible       btnLogin
    Click Button                        btnLogin

Disable login button
    Wait Until Element Is Visible       btnLogin
    Element Should Be Disabled          btnLogin

Should show error message ${MESSAGE_ERROR_LOGIN}
    Wait Until Page Contains            ${MESSAGE_ERROR_LOGIN}

Login success
    Wait Until Page Contains            หน้าหลัก

Clear data in text box
    Reload Page

Waiting for show data
    Sleep     2s

Select menu buy product
    Wait Until Element Is Visible       saleMenu
    Click Element                       saleMenu
    Waiting for show data

Should show pop up message ${MESSAGE_ERROR_FIRST_OPEN_BILL}
    Wait Until Page Contains            กรุณาตั้งค่าเปิดการขาย

Click OK button
    Wait Until Element Is Visible       dismiss-modal-button
    Click Button                        dismiss-modal-button

Click button for open bill
    Sleep   2s
    Wait Until Page Contains            เปิด/ปิดการขายประจำวัน
    Wait Until Element Is Visible       //html/body/app-root/app-after-login/div/main/div/app-daily/div/div/div[2]/div/div/div/button
    Click Element                       //html/body/app-root/app-after-login/div/main/div/app-daily/div/div/div[2]/div/div/div/button
    Wait Until Page Contains            ตั้งค่าเริ่มต้นวัน

Click close button
    Wait Until Element Is Visible       close-confirm-modal-button
    Wait Until Element Is Enabled       close-confirm-modal-button
    Click Button                        close-confirm-modal-button

Should be show pop up for fill in amount ${AMOUNT}
    Wait Until Element Is Visible       startDayAmount
    Input Text                          startDayAmount          ${AMOUNT}

Click button save for open bill
    Wait Until Element Is Visible       confirm-modal-button
    Wait Until Element Is Enabled       confirm-modal-button
    Click Button                        confirm-modal-button

Result table should be ${RESULT_AMOUNT}
    Waiting for show data
    Wait Until Page Contains            จำนวนเงินในลิ้นชักเริ่มต้น
    Wait Until Element Contains         //html/body/app-root/app-after-login/div/main/div/app-daily/div/div/div[2]/table/tbody/tr[1]/td[3]      ${RESULT_AMOUNT}
