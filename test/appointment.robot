*** Settings ***
Documentation     Making Appointment in CURA HealthCare Service
Library           SeleniumLibrary

*** Settings ***
Variables        ../variable/my_variable.py
Resource         ../Keywords/Appointment.robot
Resource         ../Keywords/Login.robot
Test Teardown    Close Browser

*** Variables ***
${BROWSER}    Firefox

*** Test Cases ***
# Make Valid Appointment
Make Valid Appointment After Login First
    Open Browser To Home Page
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

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    ${TITLE}