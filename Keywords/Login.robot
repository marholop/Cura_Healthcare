*** Settings ***
Library        SeleniumLibrary
Variables      ../variable/my_variable.py

*** Keywords ***
Access Login Menu
    Wait Until Page Contains Element    ${HOMEPAGE_HAMBURGER_MENU}    10
    Click Element    ${HOMEPAGE_HAMBURGER_MENU}
    Click Element    ${HAMBURGER_MENU_LOGIN}
    Wait Until Page Contains Element    ${LOGIN_TITLE}

Input Username
    [Arguments]    ${username}
    Input Text    ${LOGIN_USERNAME_FIELD}    ${username}

Input Username Password
    [Arguments]    ${password}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

Submit Credentials
    Click Button    ${LOGIN_BTN_SUBMIT}

Welcome Page Should Be Open
    Title Should Be    ${TITLE}

Error Test Appears When Submit with Invalid Credentials
    Wait Until Page Contains Element    ${LOGIN_ERROR_MESSAGE}
    Element Should Contain    ${LOGIN_ERROR_MESSAGE}    ${LOGIN_ERROR_MESSAGE_TXT}