*** Settings ***
Documentation     Making Appointment in CURA HealthCare Service , add comment for test Jenkins pipeline
Library           SeleniumLibrary

*** Settings ***
Variables        ../variable/my_variable.py
Resource         ../Keywords/Appointment.robot
Resource         ../Keywords/Login.robot
Test Setup       Open Browser To Home Page
Test Teardown    Close Browser

*** Variables ***
${BROWSER}    firefox

*** Test Cases ***
# Make Valid Appointment
Make Valid Appointment After Login First
    Access Login Menu
    Input Username    ${VALID_USERNAME}
    Input Username Password    ${VALID_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Select Appointment Facility
    Check Hospital Readmission
    Select Healthcare Program Medicalaid
    Set Appointment Date
    Input Comment on Appointment Page    Appointment Created
    Submit Appointment
    Confirmation Appointment Should Be Open

Make Valid Appointment Not Login First
    Click Appointment Button in Home Page
    Input Username    ${VALID_USERNAME}
    Input Username Password    ${VALID_PASSWORD}
    Submit Credentials
    Select Appointment Facility
    Check Hospital Readmission
    Select Healthcare Program Medicalaid
    Set Appointment Date
    Input Comment on Appointment Page    Appointment Created
    Submit Appointment
    Confirmation Appointment Should Be Open

Make Invalid Appointment with Empty Required Date
    Access Login Menu
    Input Username    ${VALID_USERNAME}
    Input Username Password    ${VALID_PASSWORD}
    Submit Credentials
    Welcome Page Should Be Open
    Select Appointment Facility
    Input Comment on Appointment Page    Appointment Created
    Submit Appointment
    Verify Calendar Appears when Date Field is Empty
    
*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    ${TITLE}