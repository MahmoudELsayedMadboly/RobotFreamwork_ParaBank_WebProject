*** Settings ***
Library     SeleniumLibrary
library     String
Library    Collections
Resource    ../../Config/Global_Variables.robot
Resource    BrowserKeyword.resource


*** Keywords ***
Capture And Name Screenshot
    [Documentation]    Captures a screenshot named after the currently running test case
    ${safeName}=    Replace String    ${TEST NAME}    ${SPACE}    _
    Capture Page Screenshot    ${safeName}_FAILED_{index}.png



Safe Click
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
        Wait Until Element Is Enabled    ${locator}    ${StandardWait}
        Click Element    ${locator}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is:Unable to click element '${locator}': ${error}
    END





Safe Input Text
    [Arguments]    ${locator}    ${text}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
        Wait Until Element Is Enabled    ${locator}    ${StandardWait}
        Clear Element Text    ${locator}
        Input Text    ${locator}    ${text}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Unable to input text into '${locator}': ${error}
    END




Verify Element Is Visible
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Element '${locator}' was not visible within ${StandardWait}: ${error}
    END




Verify Element Is Not Empty
    [Arguments]    ${locator}
    TRY
        Should Not Be Empty    ${locator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Element '${locator}' is empty after ${StandardWait}: ${error}
    END



Verify Text Format
    [Arguments]    ${text}    ${format}    ${formatName}=value
    TRY
        Should Match Regexp    ${text}    ${format}
    EXCEPT    AS    ${error}
        Fail    The issue is: Expected format value should be ${formatName} but got '${text}': ${error}
    END 



Navigate To Page
    [Arguments]    ${navigationLocator}    ${destinationPageLocator}
    
    TRY
        Safe Click    ${navigationLocator}
        Wait Until Page Contains Element    ${destinationPageLocator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Navigation failed — '${destinationPageLocator}' did not appear: ${error}
    END





Get Element Text
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
        ${text}=    Get Text    ${locator}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    Unable to get text from '${locator}': ${error}
    END
    RETURN    ${text}






Get List Item Options
    [Documentation]    Waits until a dropdown is populated, then returns all its option values as a list
    [Arguments]    ${locator}
    TRY
        Wait Until Keyword Succeeds    ${StandardWait}    ${PingTime}
        ...    Verify Dropdown Is Populated    ${locator}
        ${options}=    Get List Items    ${locator}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Unable to get list items from '${locator}': ${error}
    END
    RETURN    ${options}




Get Table Rows Data
    [Documentation]    Returns all rows of a table as a list of rows, each row a list of cell texts
    [Arguments]    ${tableLocator}

    ${rows}=    Get WebElements    ${tableLocator}//tr
    ${tableData}=    Create List

    FOR    ${row}    IN    @{rows}
        ${cells}=    Get WebElements    ${row}//td
        ${rowData}=    Create List

        FOR    ${cell}    IN    @{cells}
            ${cellText}=    Get Text    ${cell}
            Append To List    ${rowData}    ${cellText}
        END

        Append To List    ${tableData}    ${rowData}
    END

    RETURN    ${tableData}




Compare Element Text
    [Arguments]    ${locator}    ${expectedText}
    ${actualText}=    Get Element Text    ${locator}
    TRY
        Should Be Equal    ${actualText}    ${expectedText}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is:Text mismatch at '${locator}' — expected '${expectedText}' but got '${actualText}'
    END




Generate Unique Username
    [Documentation]    Generates a unique username to avoid duplicate-registration collisions
    ${randomSuffix}=    Generate Random String    6    [LOWER][NUMBERS]
    ${username}=    Catenate    SEPARATOR=    madboly_    ${randomSuffix}
    RETURN    ${username}



Generate Random Password
    [Documentation]    Generates a random password meeting typical complexity rules (upper, lower, digit)
    ${upper}=      Generate Random String    2    [UPPER]
    ${lower}=      Generate Random String    4    [LOWER]
    ${digits}=     Generate Random String    2    [NUMBERS]
    ${password}=   Catenate    SEPARATOR=    ${upper}    ${lower}    ${digits}    @
    RETURN    ${password}




Verify Dropdown Is Populated
    [Arguments]    ${locator}
    ${options}=    Get List Items    ${locator}
    Should Not Be Empty    ${options}




Safe Select From List
    [Documentation]    Waits until a dropdown is populated with options, then selects using the given strategy
    [Arguments]    ${locator}    ${selectionStrategy}    ${selectionValue}

    TRY
        Wait Until Keyword Succeeds    ${StandardWait}    ${PingTime}
        ...    Verify Dropdown Is Populated    ${locator}

        IF    '${selectionStrategy}' == 'index'
            Select From List By Index    ${locator}    ${selectionValue}
        ELSE IF    '${selectionStrategy}' == 'value'
            Select From List By Value    ${locator}    ${selectionValue}
        ELSE IF    '${selectionStrategy}' == 'label'
            Select From List By Label    ${locator}    ${selectionValue}
        ELSE
            Fail    Unknown selection strategy '${selectionStrategy}'. Use 'index', 'value', or 'label'.
        END

    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Unable to select from dropdown '${locator}' using strategy '${selectionStrategy}': ${error}
    END






Convert Currency Text To Number
    [Documentation]    Converts a currency-formatted string like '$515.50' into a numeric value
    [Arguments]    ${currencyText}
    TRY
        ${cleaned}=    Remove String    ${currencyText}    $    ,
        ${number}=    Convert To Number    ${cleaned}
    EXCEPT    AS    ${error}
        Fail    The issue is: Unable to convert '${currencyText}' to a number: ${error}
    END
    RETURN    ${number}


