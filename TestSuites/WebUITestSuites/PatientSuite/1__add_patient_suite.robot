*** Settings ***
Documentation       This suite files test all valid login scenarios

Resource    ../../../Resouce/UI/CommonFunctionalities.resource
Resource    ../../../Resouce/UI/Pages/LoginPage.resource

Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

*** Test Cases ***
Add Valid Patient Test
    Enter Username  Admin
    Enter Password    pass
    Select Language By Lable   English (Indian)
    Click Login

    #MainPage.resource
    #click patient
    #click new search menu

#    SearchORAddPatientPage.resource
    #add first name as john
    #lastname as wick
    #select gender
    #enter today's date
    #click create patient
    #click on confirm create patient
    #handle alert
#    close happy bday popup if available
    Run Keyword And Ignore Error    Click Element    xpath=//div[class="closeDlgIframe"]
#    PatientDashboardPage.resource
    #validate the added patient name


