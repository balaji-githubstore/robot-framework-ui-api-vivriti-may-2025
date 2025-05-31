*** Settings ***
Documentation       This suite files test all valid login scenarios

Resource    ../../../Resource/UI/CommonFunctionalities.resource
Resource    ../../../Resource/UI/Pages/LoginPage.resource

Test Setup      Launch Browser And Navigate To Url
Test Teardown   Close Browser

*** Test Cases ***
Invalid Login Test
    [Documentation]     US_29449
    ...  Given application is open
    ...  When invalid login
    ...  then user not should access portal
    Enter Username  john
    Enter Password    johjn12
    Select Language By Lable   English (Indian)
    Click Login
    Element Text Should Be    //p[contains(normalize-space(),'Invalid')]    ${Messages.ERROR.invalid_login_error}