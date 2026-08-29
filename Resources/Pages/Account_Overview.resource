*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${ACCOUNTS_OVERVIEW_HEADER}    
...    xpath=//h1[normalize-space()='Accounts Overview']
   

*** Keywords ***

Verify Accounts Overview Page Is Displayed
    Verify Element Is Visible    
    ...    ${ACCOUNTS_OVERVIEW_HEADER}


Verify New Opened Account Appears In Accounts Table
    [Arguments]       
    ...    ${NewAccountId}
    
    Verify Element Is Visible    
    ...    xpath=//table[@id='accountTable']/tbody/tr/td[1]/a[text()='${NewAccountId}']




Get Account With Sufficient Balance
    [Documentation]    Loops through Accounts Overview table and returns the first account with balance greater than the given amount
    [Arguments]    ${minimumBalance}

    ${tableData}=    Get Table Rows Data    xpath=//table[@id='accountTable']

    FOR    ${row}    IN    @{tableData}
        ${accountId}=    Set Variable    ${row}[0]
        ${isNumeric}=    Run Keyword And Return Status    Should Match Regexp    ${accountId}    ^[0-9]+$

        IF    ${isNumeric}
            ${balanceText}=    Set Variable    ${row}[1]
            ${balance}=    Convert Text To Number    ${balanceText}
            IF    ${balance} > ${minimumBalance}
                RETURN    ${accountId}    ${balance}
            END
        END
    END

    Fail    No account found with balance greater than ${minimumBalance}