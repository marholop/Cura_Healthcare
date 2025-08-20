*** Settings ***
Documentation     Login in CURA HealthCare Service
Library           SeleniumLibrary
Variables         ../variable/my_variable.py
Resource          ../Keywords/Login.robot
Test Setup        Open Browser To Home Page
Test Teardown     Close Browser

*** Variables ***
${BROWSER}    Firefox

*** Test Cases ***
# Valid Test Case
Valid Login
    Access Login Menu
    Input Username    ${VALID_USERNAME}
    Input Username Password    ${VALID_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open

# Invalid Test Case
Login with Username Field and Password Field Empty
    Access Login Menu
    Submit Credentials
    Error Test Appears When Submit with Invalid Credentials

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    ${TITLE}