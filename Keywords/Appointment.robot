*** Settings ***
Library        SeleniumLibrary
Variables      ../variable/my_variable.py

*** Keywords ***
Select Appointment Facility
    Click Element      ${APPOINTMENT_COMBO_FACILITY}
    Sleep    3
    Click Element    ${APPOINTMENT_COMBO_FACILITY_SEOUL}

Check Hospital Readmission
    Click Element    ${APPOINTMENT_CHECK_BOX_APPLY_HOSPITAL_REDMISSION}

Select Healthcare Program Medicalaid
    Click Element    ${APPOINTMENT_RADIO_BTN_HEALTHCARE_PROGRAM_MEDICALAID}

Set Appointment Date
    Click Element    ${APPOINTMENT_DATE}
    Sleep    3
    Click Element    ${APPOINTMENT_DATE_RDN_DATE}

Input Comment on Appointment Page
    [Arguments]    ${comments}
    Input Text    ${APPOINTMENT_COMMENT}    ${comments}

Submit Appointment
    Click Element    ${APPOINTMENT_BTN}

Confirmation Appointment Should Be Open
    Wait Until Page Contains Element    ${APPOINTMENT_CONFIRMATION_H2}
    Element Text Should Be    ${APPOINTMENT_CONFIRMATION_H2}    ${APPOINTMENT_CONFIRMATION_TXT}

Click Appointment Button in Home Page
    Click Element    ${HOMEPAGE_APPOINTMENT_BTN}

Verify Calendar Appears when Date Field is Empty
    Wait Until Page Contains Element    ${APPOINTMENT_CALENDAR}
    