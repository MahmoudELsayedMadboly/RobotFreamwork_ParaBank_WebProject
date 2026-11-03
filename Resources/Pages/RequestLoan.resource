*** Settings ***
Documentation     Page object for ParaBank "Request Loan" page (requestloan.htm).
Library           SeleniumLibrary
Resource          ../Common/CommonKeyword.resource


*** Variables ***
# ---------- Locators: Request Loan page ----------
${LOAN_AMOUNT_FIELD}          id=amount
${LOAN_DOWN_PAYMENT_FIELD}    id=downPayment
${LOAN_FROM_ACCOUNT_LIST}     id=fromAccountId
${LOAN_APPLY_NOW_BUTTON}      xpath=//input[@value='Apply Now']

# ---------- Locators: loan result ----------
${LOAN_RESULT_HEADER}         xpath=//h1[@class='title' and normalize-space(text())='Loan Request Processed']
${LOAN_STATUS_VALUE}          id=loanStatus
${LOAN_NEW_ACCOUNT_LINK}      id=newAccountId


*** Keywords ***
Enter Loan Amount
    [Arguments]    ${loanAmount}
    [Documentation]    Types the requested loan amount

    Safe Input Text    ${LOAN_AMOUNT_FIELD}    ${loanAmount}


Enter Down Payment Amount
    [Arguments]    ${downPayment}
    [Documentation]    Types the down payment amount

    Safe Input Text    ${LOAN_DOWN_PAYMENT_FIELD}    ${downPayment}


Select Loan From Account
    [Arguments]    ${accountIndex}=0
    [Documentation]    Selects the account that the down payment is taken from (first account by default)

    Safe Select From List
    ...    ${LOAN_FROM_ACCOUNT_LIST}
    ...    index
    ...    ${accountIndex}


Hit Apply Now Button
    [Documentation]    Clicks the Apply Now button

    Safe Click    ${LOAN_APPLY_NOW_BUTTON}


Submit Loan Request
    [Arguments]    ${loanAmount}    ${downPayment}    ${accountIndex}=0
    [Documentation]    Fills the loan form (single page) and submits it

    Enter Loan Amount    ${loanAmount}

    Enter Down Payment Amount    ${downPayment}

    Select Loan From Account    ${accountIndex}

    Hit Apply Now Button


Verify Loan Status
    [Arguments]    ${expectedStatus}
    [Documentation]    Waits for the result section, then compares the loan status text

    Verify Element Is Visible    ${LOAN_RESULT_HEADER}

    Compare Element Text    ${LOAN_STATUS_VALUE}    ${expectedStatus}


Get New Loan Account Number
    [Documentation]    Returns the account number of the newly created loan account (approved loans only)

    Verify Element Is Visible    ${LOAN_NEW_ACCOUNT_LINK}

    ${loanAccountNumber}=    Get Element Text    ${LOAN_NEW_ACCOUNT_LINK}

    Should Not Be Empty    ${loanAccountNumber}

    RETURN    ${loanAccountNumber}


Verify New Loan Account Is Not Created
    [Documentation]    Used for the denied case: no new account link is shown

    Element Should Not Be Visible    ${LOAN_NEW_ACCOUNT_LINK}


Verify Loan Account Is Listed In Accounts Overview
    [Arguments]    ${loanAccountNumber}
    [Documentation]    Run this while the Accounts Overview page is open

    Verify Element Is Visible
    ...    xpath=//table[@id='accountTable']//a[normalize-space(text())='${loanAccountNumber}']


Get Selected Loan From Account Number
    [Documentation]    Returns the account number currently selected in the "From account" list

    ${fromAccount}=    Get Selected List Label    ${LOAN_FROM_ACCOUNT_LIST}

    Should Not Be Empty    ${fromAccount}

    RETURN    ${fromAccount}