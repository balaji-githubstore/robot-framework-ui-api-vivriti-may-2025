*** Settings ***
Resource    ../../../Resource/API/CommonFunctionalities.resource

*** Test Cases ***
Verify List Users Test    
    &{query_param}    Create Dictionary    page=2   
    ${response}     GET On Session    alias=reqres    url=${REQRES.LIST_USERS.end_point}    params=${query_param}     expected_status=any
    Status Should Be     200
