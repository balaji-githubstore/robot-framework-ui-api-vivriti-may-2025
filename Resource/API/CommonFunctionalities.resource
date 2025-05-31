*** Settings ***
Library      RequestsLibrary
Library      RPA.JSON
Library      Collections
Library    ../../../Helpers/helpers_api.py


*** Keywords ***
Create Reqres Session With API Key
    &{headers}    Create Dictionary    x-api-key=${REQRES.API_KEY} 
    Create Session    alias=reqres    url=${REQRES.BASE_URL}  

Create Git Session With Basic Auth
    Create Session    alias=git    url=${GIT.BASE_URL}  
     


