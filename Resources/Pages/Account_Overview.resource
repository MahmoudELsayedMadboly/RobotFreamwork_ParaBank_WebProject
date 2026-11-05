*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${ACCOUNTS_OVERVIEW_HEADER}    
...    xpath=//h1[normalize-space()='Accounts Overview']
${ACCOUNTS_TABLE}
...    id=accountTable 
${ERROR_PAGE_HEADER}           
...    xpath=//div[@id='rightPanel']//h1[@class='title' and normalize-space(text())='Error!']
${ERROR_PAGE_MESSAGE}          
...    xpath=//div[@id='rightPanel']//p[@class='error']



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





Get Account Balance
    [Arguments]    ${accountNumber}
    [Documentation]    Run this while Accounts Overview is open. Returns the balance of the given account as a number.

    ${balanceLocator}=    Set Variable
    ...    xpath=//table[@id='accountTable']//a[normalize-space(text())='${accountNumber}']/ancestor::tr/td[2]

    Verify Element Is Visible    ${balanceLocator}

    ${balanceText}=    Get Element Text    ${balanceLocator}

    ${balance}=    Convert Text To Number    ${balanceText}

    RETURN    ${balance}



Verify Accounts Data Is Not Displayed
    Element Should Not Be Visible    ${ACCOUNTS_TABLE}


Verify Internal Error Message Is Displayed
    [Arguments]    ${expectedMessage}
    [Documentation]    Waits for the error message and compares its text exactly

    Verify Element Is Visible    ${ERROR_PAGE_MESSAGE}

    ${actualMessage}=    Get Text    ${ERROR_PAGE_MESSAGE}

    Should Be Equal    ${actualMessage}    ${expectedMessage}