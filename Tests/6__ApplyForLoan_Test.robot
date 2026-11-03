*** Settings ***
Documentation     Request Loan scenarios (positive and negative)
Resource          ../Resources/Common/BrowserKeyword.resource
Resource          ../Resources/Pages/HomePage.resource
Resource          ../Resources/Pages/RequestLoan.resource
Resource          ../Resources/Pages/Account_Overview.resource
Resource          ../Resources/Common/SetupFlows/CreateUserFlow.resource
resource          ../TestData/RquestLoan_Data.robot

Suite Setup       Register Fresh User And Store Credentials
Suite Teardown    Close Application Browser

Test Setup        Initialize Browser And Login
...    ${REGISTERED_USERNAME}
...    ${REGISTERED_PASSWORD}
Test Teardown     Close Application Browser


*** Test Cases ***
TC_LOAN_001: Verify Loan Request Is Approved (Sufficient Funds)
    [Documentation]    A valid loan is approved, the new loan account appears in Accounts Overview,
    ...                and the "from" account balance decreases by exactly the down payment.
    [Tags]    Regression    Smoke    Positive

    Navigate To Request Loan Page

    ${fromAccount}=    Get Selected Loan From Account Number

    Navigate To Accounts Overview Page

    ${balanceBefore}=    Get Account Balance    
    ...    ${fromAccount}

    Navigate To Request Loan Page

    Submit Loan Request    
    ...    ${LOAN_AMOUNT_VALID}    
    ...    ${LOAN_DOWN_PAYMENT_VALID}

    Verify Loan Status    
    ...    ${LOAN_STATUS_APPROVED}

    ${newLoanAccount}=    Get New Loan Account Number

    Navigate To Accounts Overview Page

    Verify Loan Account Is Listed In Accounts Overview    
    ...    ${newLoanAccount}

    ${balanceAfter}=    Get Account Balance    ${fromAccount}

    ${expectedBalance}=    Evaluate    round(${balanceBefore} - ${LOAN_DOWN_PAYMENT_VALID}, 2)

    Should Be Equal As Numbers    
    ...    ${balanceAfter}    
    ...    ${expectedBalance}
    ...    msg=Balance before ${balanceBefore}, down payment ${LOAN_DOWN_PAYMENT_VALID}, expected ${expectedBalance} but got ${balanceAfter}




TC_LOAN_002: Verify Loan Request Is Denied (Insufficient Funds)
    [Documentation]    A down payment bigger than the account balance is denied and no loan account is created.
    [Tags]    Regression    Negative

    Navigate To Request Loan Page

    Submit Loan Request    
    ...    ${LOAN_AMOUNT_EXCESSIVE}    ${LOAN_DOWN_PAYMENT_EXCESSIVE}

    Sleep    10s


    Verify Loan Status    
    ...    ${LOAN_STATUS_DENIED}

    Verify New Loan Account Is Not Created