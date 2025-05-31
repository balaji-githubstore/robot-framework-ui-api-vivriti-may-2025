*** Settings ***
Resource    ../../../Resource/API/CommonFunctionalities.resource

*** Test Cases ***
Verify List Users Test    
    &{query_param}    Create Dictionary    page=2   
    ${response}     GET On Session    alias=reqres    url=${REQRES.LIST_USERS.end_point}    params=${query_param}     expected_status=any
    Status Should Be     200
    Dictionaries Should Be Equal    ${response.json()}      ${REQRES.LIST_USERS.expected_body} 

Verify Upload Two Files Petshop
   ${pay_load}  Create Dictionary    additionalMetadata=image/png

   ${file1}     Create Dictionary    filekey=file     path=${EXECDIR}${/}Data${/}demo.png       type=image/png
   ${file2}     Create Dictionary    filekey=file     path=${EXECDIR}${/}Data${/}demo.png       type=image/png

   @{list_of_files}     Create List  ${file1}  ${file2}

   ${response}      Post On Session Upload    base_url=${Petshop.base_url}    
   ...    end_point=${Petshop.upload_pet.end_point}   headers=${pay_load}      
   ...    payload=${pay_load}     files_to_upload=${list_of_files}
   
   Log    ${response}
   Should Be Equal As Integers    ${response.status_code}    200

    