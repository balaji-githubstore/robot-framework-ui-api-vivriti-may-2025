*** Settings ***
Resource    ../../../Resource/API/CommonFunctionalities.resource

Suite Setup    Create Git Session With Basic Auth
Suite Teardown    Delete All Sessions

