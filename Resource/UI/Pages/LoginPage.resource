*** Settings ***
Documentation   This resource handles all the element in the login page

Resource    ../CommonFunctionalities.resource

*** Variables ***
${USERNAME_LOCATOR}     id=authUser
${PASSWORD_LOCATOR}     id=clearPass
${LOGIN_LOCATOR}    id=login-button
${ERROR_LOCATOR}    //p[contains(normalize-space(),'Invalid')]
${LANGUAGE_LOCATOR}     name=languageChoice


*** Keywords ***
Enter Username
    [Arguments]     ${username}
    Set Text To The Element   ${USERNAME_LOCATOR}  ${username}

Enter Password
    [Arguments]     ${password}
    Wait Until Page Contains Element    ${PASSWORD_LOCATOR}
    Input Password    ${PASSWORD_LOCATOR}   ${password}

Select Language By Lable
    [Arguments]     ${language}
    Select From List By Label    name=languageChoice    ${language}

Click Login
    Click Interactable Element    ${LOGIN_LOCATOR}

Verify Invalid Login Error Message
    [Arguments]    ${expected_error}
    Wait Until Keyword Succeeds    30s    500ms    Element Text Should Be    ${ERROR_LOCATOR}    ${expected_error}
    