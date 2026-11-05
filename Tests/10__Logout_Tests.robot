*** Settings ***
Documentation     Logout scenarios
Resource          ../Resources/Common/BrowserKeyword.resource
Resource          ../Resources/Pages/HomePage.resource
Resource          ../Resources/Pages/Login.resource
Resource          ../Resources/Common/SetupFlows/CreateUserFlow.resource
resource          ../Resources/Pages/Account_Overview.resource
resource          ../TestData/AccountsOverview_Data.robot


Suite Setup       Register Fresh User And Store Credentials
Suite Teardown    Close Application Browser

Test Setup        Initialize Browser And Login
...    ${REGISTERED_USERNAME}
...    ${REGISTERED_PASSWORD}
Test Teardown     Close Application Browser


*** Test Cases ***
TC_LOGOUT_001: Verify Successful Logout
    [Documentation]    A logged-in user logs out and sees the login form again.
    [Tags]    Regression    Smoke    Positive

    Verify Accounts Overview Page Is Displayed

    Log Out Of Application

    Verify Login Form Is Displayed

    Verify Log Out Link Is Not Displayed


TC_LOGOUT_002: Verify Session Ends After Logout
    [Documentation]    After logout, opening an authenticated page by URL does not show account data.
    [Tags]    Regression    Security

    Log Out Of Application

    Verify Login Form Is Displayed

    Navigate Directly To Accounts Overview

    Verify Login Form Is Displayed

    Verify Internal Error Message Is Displayed    
    ...    ${LOGOUT_DIRECT_ACCESS_ERROR_MESSAGE}

    Verify Accounts Data Is Not Displayed