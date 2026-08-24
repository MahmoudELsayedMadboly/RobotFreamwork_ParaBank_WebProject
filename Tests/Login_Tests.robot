*** Settings ***
Resource    ../Resources/Common/BrowserKeyword.resource
Resource    ../Resources/Pages/Register.resource
Resource    ../TestData/Registration_Data.robot
Resource    ../TestData/Login_Data.robot
resource    ../Resources/Pages/HomePage.resource
resource    ../Resources/Pages/Login.resource

Test Setup       Initialize Browser
Test Teardown    Close Application Browser


*** Test Cases ***

TC_001_Login With Valid Credential
    [Documentation]    This test case for verifying login with valid user credentials
    [Tags]    Regression    

    login With User Credentials    
    ...    ${validUsername}    
    ...    ${validPassword}

    Verify Login Success    
    ...    ${ExpectedSuccessHeaderText}


#I commented TC002 and TC003 because currently the site accepts all credentials, either was valid or invalid.

# TC_002_Login With Invalid UserName

#     [Documentation]    This test case for verifying login with invalid username
#     [Tags]    Regression

#     login With User Credentials    
#     ...    ${invalidUsername}    
#     ...    ${validPassword}

#     Verify Login Failure    
#     ...    ${LOGIN_ERROR_MESSAGE_InvalidCredentials}    
#     ...    ${expectedFailureHeaderText_InvalidCredentials}


# TC_003_Login With Invalid User Password
#     [Documentation]    This test case for verifying login with invalid user password
#     [Tags]    Regression    Smoke

#     login With User Credentials    
#     ...    ${validUsername}    
#     ...    ${invalidPassword}

#     Verify Login Failure    
#     ...    ${LOGIN_ERROR_MESSAGE_InvalidCredentials}    
#     ...    ${expectedFailureHeaderText_InvalidCredentials}




TC_004_Login With Empty User Password
    [Documentation]    This test case for verifying login with empty user password
    [Tags]    Regression    Smoke

    login With User Credentials    
    ...    ${EMPTY}    
    ...    ${EMPTY}

    Verify Login Failure    
    ...    ${LOGIN_ERROR_MESSAGE_NullCredentials}    
    ...    ${expectedFailureHeaderText_NullCredentials}
