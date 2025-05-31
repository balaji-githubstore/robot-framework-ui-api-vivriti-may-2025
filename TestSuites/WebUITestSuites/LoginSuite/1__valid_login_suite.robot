*** Settings ***
Documentation       This suite files test all valid login scenarios

Resource    ../../../Resource/UI/CommonFunctionalities.resource
Resource    ../../../Resource/UI/Pages/LoginPage.resource

Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

Test Template   Valid Login Template

*** Test Cases ***
Valid Login Test For Administrator
    admin   pass    English (Indian)    OpenEMR

Valid Login Test For Physician
    physician   physician    English (Indian)    OpenEMR


*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${language}     ${expected_title}
    Enter Username  ${username}
    Enter Password    ${password}
    Select Language By Lable   ${language}
    Click Login
    Title Should Be    ${expected_title}







    