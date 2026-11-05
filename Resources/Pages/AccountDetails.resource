*** Settings ***
Documentation     Page object for ParaBank "Account Details" page (activity.htm)
Library           SeleniumLibrary
Resource          ../Common/CommonKeyword.resource


*** Variables ***
${ACCOUNT_DETAILS_HEADER}        xpath=//h1[@class='title' and normalize-space(text())='Account Details']
${ACCOUNT_DETAILS_ID}            id=accountId
${ACCOUNT_DETAILS_BALANCE}       id=balance


*** Keywords ***
Verify Account Details Page Is Displayed
    Verify Element Is Visible    ${ACCOUNT_DETAILS_HEADER}


Get Account Id
    ${accountId}=    Get Element Text    ${ACCOUNT_DETAILS_ID}

    RETURN    ${accountId}


Get Account Details Balance
    ${balanceText}=    Get Element Text    ${ACCOUNT_DETAILS_BALANCE}

    ${balance}=    Convert Text To Number    ${balanceText}

    RETURN    ${balance}