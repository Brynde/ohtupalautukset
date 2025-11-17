*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Register Page


*** Test Cases ***
Register With Valid Username And Password
    Input Text  username  pekka
    Input Text  password  hyväsalasana1
    Input Text  password_confirmation  hyväsalasana1
    Click Button  Register
    Registration Should Succeed For User

Register With Too Short Username And Valid Password
    Input Text  username  ei
    Input Text  password  hyväsalasana1
    Input Text  password_confirmation  hyväsalasana1
    Click Button  Register
    Registration Should Fail With Message  Username must be at least 3 characters long

Register With Valid Username And Too Short Password
    Input Text  username  kaapo
    Input Text  password  lyhyt1
    Input Text  password_confirmation  lyhyt1
    Click Button  Register
    Registration Should Fail With Message  Password must be at least 8 characters

Register With Valid Username And Invalid Password
    Input Text  username    mikko
    Input Text  password    pelkkiakirjaimia
    Input Text  password_confirmation    pelkkiakirjaimia
    Click Button  Register
    Registration Should Fail With Message  Password cannot contain only letters

Register With Nonmatching Password And Password Confirmation
    Input Text  username  jyrki
    Input Text  password  hyväsalasana1
    Input Text  password_confirmation  erisalasana1
    Click Button  Register
    Registration Should Fail With Message  Passwords do not match

Register With Username That Is Already In Use
    Input Text  username  kalle
    Input Text  password  kalle123
    Input Text  password_confirmation  kalle123
    Click Button  Register
    Registration Should Fail With Message  Username is already taken


*** Keywords ***
Registration Should Succeed For User
    Welcome Page Should Be Open

Registration Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password Confirmation
    [Arguments]  ${password}
    Input Password  password_confirmation  ${password}

*** Keywords ***
Reset Application Create User And Go To Register Page
    Reset Application
    Create User  kalle  kalle123
    Go To Register Page