# CURA Healthcare
URL = "https://katalon-demo-cura.herokuapp.com/"
TITLE = "CURA Healthcare Service"

HOMEPAGE_HAMBURGER_MENU = "//a[@id='menu-toggle']"

HAMBURGER_MENU_LOGIN = "//a[normalize-space()='Login']"

# Login Page
LOGIN_TITLE = "//h2[normalize-space()='Login']"
LOGIN_USERNAME_FIELD = "//input[@id='txt-username']"
LOGIN_PASSWORD_FIELD = "//input[@id='txt-password']"
LOGIN_BTN_SUBMIT = "//button[@id='btn-login']"
LOGIN_ERROR_MESSAGE = "//p[@class='lead text-danger']"
LOGIN_ERROR_MESSAGE_TXT = "Login failed! Please ensure the username and password are valid."

#Credential
VALID_USERNAME = "John Doe"
VALID_PASSWORD = "ThisIsNotAPassword"

#Appointment Page
APPOINTMENT_COMBO_FACILITY = "//select[@id='combo_facility']"
APPOINTMENT_COMBO_FACILITY_SEOUL = "//option[@value='Seoul CURA Healthcare Center']"
APPOINTMENT_CHECK_BOX_APPLY_HOSPITAL_REDMISSION = "//label[normalize-space()='Apply for hospital readmission']"
APPOINTMENT_RADIO_BTN_HEALTHCARE_PROGRAM_MEDICALAID = "//label[normalize-space()='Medicaid']"
APPOINTMENT_DATE = "//input[@id='txt_visit_date']"
APPOINTMENT_DATE_RDN_DATE = "//td[normalize-space()='12']"
APPOINTMENT_COMMENT = "//textarea[@id='txt_comment']"
APPOINTMENT_BTN = "//button[@id='btn-book-appointment']"
APPOINTMENT_CALENDAR = "//div[@class='datepicker datepicker-dropdown dropdown-menu datepicker-orient-left datepicker-orient-top']"

#HomePage
HOMEPAGE_APPOINTMENT_BTN = "//a[@id='btn-make-appointment']"

#Appoitnment Confirmation
APPOINTMENT_CONFIRMATION_H2 = "//h2[normalize-space()='Appointment Confirmation']"
APPOINTMENT_CONFIRMATION_TXT = "Appointment Confirmation"