*** Settings ***
Resource          pos_keyword.robot
Resource          common_variables.robot

Library         Selenium2Library
Library         BuiltIn

Suite Setup     Run Keywords    Open browser POS    AND
                ...             Login with username "cat"


*** Variable ***
${URL}     https://www.pos.ondemo.app


*** Test Case ***
Select menu buy product before open bill
    Select menu buy product
    Should show pop up message กรุณาตั้งค่าเปิดการขาย
    Click OK button

First open bill
    Click button for open bill
    Click close button
    Click button for open bill
    Should be show pop up for fill in amount 300
    Click button save for open bill

Check result on the table
    Result table should be 300.00