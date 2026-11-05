*** Settings ***
Documentation     Accounts Overview scenarios
Resource          ../Resources/Common/BrowserKeyword.resource
Resource          ../Resources/Common/commonKeyword.resource
Resource          ../Resources/Pages/Account_Overview.resource
Resource          ../Resources/Pages/AccountDetails.resource
Resource          ../Resources/Common/SetupFlows/CreateUserFlow.resource

Suite Setup       Register Fresh User And Store Credentials
Suite Teardown    Close Application Browser

Test Setup        Initialize Browser And Login
...    ${REGISTERED_USERNAME}
...    ${REGISTERED_PASSWORD}
Test Teardown     Close Application Browser


*** Test Cases ***
TC_ACC_001: Verify Accounts List Displays After Login
    [Documentation]    After login the user lands on Accounts Overview, and every account row
    ...                shows an Account ID, a Balance and an Available Amount.
    [Tags]    Regression    Smoke

    Verify Accounts Overview Page Is Displayed

    Verify At Least One Account Row Is Displayed

    Verify Each Account Row Shows Required Details


TC_ACC_002: Verify Account Balance Displayed Correctly
    [Documentation]    The balance on the Account Details page matches the balance on Accounts Overview.
    [Tags]    Regression

    Verify Accounts Overview Page Is Displayed

    ${accountId}=    Get First Account Id

    ${overviewBalance}=    Get Account Balance    
    ...    ${accountId}

    Open Account Details    
    ...    ${accountId}

    Verify Account Details Page Is Displayed

    ${detailsAccountId}=    Get Account Id


    Compare Element Text    
    ...    ${detailsAccountId}    
    ...    ${accountId}    

    # Should Be Equal    
    # ...    ${detailsAccountId}    
    # ...    ${accountId}


    log to console    details account id : ${detailsAccountId} 
    log to console    account id : ${accountId}

    ${detailsBalance}=    Get Account Details Balance

    Should Be Equal As Numbers    
    ...    ${detailsBalance}    
    ...    ${overviewBalance}
    ...    msg=Overview balance ${overviewBalance} but details page shows ${detailsBalance}