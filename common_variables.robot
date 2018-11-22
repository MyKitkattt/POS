*** Settings ***
Documentation   Test login fail

Resource          pos_keyword.robot

Library           Selenium2Library
Library           BuiltIn


*** Variable ***
${URL}     https://www.pos.ondemo.app
