*** Settings ***
Documentation       This suite files test all valid login scenarios

Resource    ../../../Resource/UI/CommonFunctionalities.resource
Resource    ../../../Resource/UI/Pages/LoginPage.resource

Library    DataDriver      file=../../../Data/LoginSuiteData/open-emr-data.xlsx    sheet_name=ValidLoginTemplate

Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

Test Template   Valid Login Template

*** Test Cases ***
Verify_Valid_Login_${testcase_id}


*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${language}     ${expected_title}
    Enter Username  ${username}
    Enter Password    ${password}
    Select Language By Lable   ${language}
    Click Login
    Title Should Be    ${expected_title}







    