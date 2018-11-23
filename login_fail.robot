*** Settings ***
Resource          pos_keyword.robot
Resource          common_variables.robot

Library         Selenium2Library

Suite Setup         Open browser POS
Test Teardown       Reload Page


*** Variable ***
${URL}     https://www.pos.ondemo.app


*** Test Case ***

Not fill in username and password
    Disable login button

Fill in username only
    Fill in username cat
    Disable login button

Fill in password only
    Fill in password password
    Click login button

Fill in username incorrect
    Fill in username catttt
    Fill in password password
    Click login button
    Should show error message ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

Fill in password incorrect
    Fill in username cat
    Fill in password 1234
    Click login button
    Should show error message ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง

#test edit file
