*** Settings ***
Documentation       Manages the commonfunctionalities of web ui automation

Library     SeleniumLibrary
Library     RPA.JSON

# *** Variables ***
# ${BASE_URL}     https://demo.openemr.io/b/openemr
# ${BROWSER_NAME}     chrome

*** Keywords ***
Launch Browser And Navigate To Url
    [Documentation]     Use the keyword to launch browser and navigate to
    ...     open emr application
    ...     Example \n
    ...     | Launch Browser and Navigate to Url |
    Open Browser    browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${default_timeout}s
    Set Selenium Timeout    ${default_timeout}s
    Set Screenshot Directory    path=${EXECDIR}${/}Screenshots
    # Setup Json Data
    Go To    url=${BASE_URL}

Click Interactable Element
    [Documentation]     Use Keyword to click on interactable element    \n
    ...     Example \n
    ...     | Click Interactable Element | xpath=//button[@id='main']   | timeout=40s |
    [Arguments]     ${locator}      ${timeout}=${default_timeout}s
    Wait Until Page Contains Element    ${locator}  ${timeout}
    Wait Until Element Is Visible    ${locator}     ${timeout}
    Wait Until Element Is Enabled    ${locator}     ${timeout}
    Click Element    ${locator}

Set Text To The Element
    [Arguments]     ${locators}     ${text}
    Wait Until Page Contains Element    ${locators}
    Input Text    ${locators}    ${text}
   
Click Until Element Succeed
    [Documentation]     Use Keyword to click on interactable element
    ...     Example \n
    ...     | Click Until Element Succeed   | retry=40s | retry_interval=30s |
     ...     | Click Until Element Succeed   | retry=40x | retry_interval=30s |
    [Arguments]     ${locator}  ${retry}=${default_timeout}s     ${retry_interval}=${default_timeout}s
    Wait Until Keyword Succeeds    ${retry}    ${retry_interval}    Click Element    ${locator}
    
    
Setup Json Data
    ${json}    Load JSON from file       ${EXECDIR}${/}Data${/}demo.json
    Set Global Variable    ${JSON}     ${json} 

