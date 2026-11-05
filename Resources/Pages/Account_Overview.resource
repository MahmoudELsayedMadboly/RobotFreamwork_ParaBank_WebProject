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

${FIRST_ACCOUNT_ID_LINK}        
...    xpath=(//table[@id='accountTable']//tbody/tr/td[1]/a)[1]
${ACCOUNT_ROWS}    
...    xpath=//table[@id='accountTable']//tbody/tr[td[1]/a]

${COLUMN_ACCOUNT_ID}           
...     1
${COLUMN_BALANCE}               
...    2
${COLUMN_AVAILABLE_AMOUNT}      
...    3

${ACCOUNT_ID_FORMAT}            
...    ^[0-9]+$
${CURRENCY_FORMAT}              
...    ^-?[$]-?[\\d,]+\\.\\d{2}$




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





# Get Account Balance
#     [Arguments]    ${accountNumber}
#     [Documentation]    Run this while Accounts Overview is open. Returns the balance of the given account as a number.

#     ${balanceLocator}=    Set Variable
#     ...    xpath=//table[@id='accountTable']//a[normalize-space(text())='${accountNumber}']/ancestor::tr/td[2]

#     Verify Element Is Visible    ${balanceLocator}

#     ${balanceText}=    Get Element Text    ${balanceLocator}

#     ${balance}=    Convert Text To Number    ${balanceText}

#     RETURN    ${balance}



Verify Accounts Data Is Not Displayed
    Element Should Not Be Visible    
    ...    ${ACCOUNTS_TABLE}


Verify Internal Error Message Is Displayed
    [Arguments]    ${expectedMessage}
    [Documentation]    Waits for the error message and compares its text exactly

    Verify Element Is Visible    ${ERROR_PAGE_MESSAGE}

    ${actualMessage}=    Get Text    ${ERROR_PAGE_MESSAGE}

    Should Be Equal    ${actualMessage}    ${expectedMessage}

#-------------------------------------


Verify At Least One Account Row Is Displayed
    [Documentation]    The table is filled by JavaScript, so wait for the first account link first

    Verify Element Is Visible    
    ...    ${FIRST_ACCOUNT_ID_LINK}

    ${rowCount}=    Get Element Count    
    ...    ${ACCOUNT_ROWS}

    Should Be True    
    ...    ${rowCount} >= 1    No account row was found in the accounts table


Get Account Table Cell Text
    [Arguments]    ${rowIndex}    ${columnIndex}
    [Documentation]    Returns the text of one cell. Only rows that contain an account link are counted.

    ${text}=    Get Element Text
    ...    xpath=(//table[@id='accountTable']//tbody/tr[td[1]/a])[${rowIndex}]/td[${columnIndex}]

    RETURN    ${text}


Verify Each Account Row Shows Required Details
    [Documentation]    Every account row must show a numeric Account ID, a Balance and an Available Amount

    ${rowCount}=    Get Element Count    ${ACCOUNT_ROWS}

    ${lastIndex}=    Evaluate    ${rowCount} + 1

    FOR    ${index}    IN RANGE    1    ${lastIndex}

        ${accountId}=    Get Account Table Cell Text    ${index}    ${COLUMN_ACCOUNT_ID}

        ${balance}=    Get Account Table Cell Text    ${index}    ${COLUMN_BALANCE}

        ${available}=    Get Account Table Cell Text    ${index}    ${COLUMN_AVAILABLE_AMOUNT}

        Verify Text Format    ${accountId}    ${ACCOUNT_ID_FORMAT}    account id in row ${index}

        Verify Text Format    ${balance}      ${CURRENCY_FORMAT}      balance in row ${index}

        Verify Text Format    ${available}    ${CURRENCY_FORMAT}      available amount in row ${index}

    END


Get First Account Id
    [Documentation]    Returns the account number of the first account in the table

    Verify Element Is Visible    ${FIRST_ACCOUNT_ID_LINK}

    ${accountId}=    Get Element Text    ${FIRST_ACCOUNT_ID_LINK}

    RETURN    ${accountId}


Open Account Details
    [Arguments]    ${accountId}
    [Documentation]    Clicks the account number link to open its details page

    Safe Click
    ...    xpath=//table[@id='accountTable']//a[normalize-space(text())='${accountId}']


Get Account Balance
    [Arguments]    ${accountNumber}
    [Documentation]    Run this while Accounts Overview is open. Returns the balance of the given account as a number.

    ${balanceLocator}=    Set Variable
    ...    xpath=//table[@id='accountTable']//a[normalize-space(text())='${accountNumber}']/ancestor::tr/td[${COLUMN_BALANCE}]

    Verify Element Is Visible    ${balanceLocator}

    ${balanceText}=    Get Element Text    ${balanceLocator}

    ${balance}=    Convert Text To Number    ${balanceText}

    RETURN    ${balance}
