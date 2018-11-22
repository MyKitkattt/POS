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