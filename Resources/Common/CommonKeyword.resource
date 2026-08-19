*** Settings ***
Library     SeleniumLibrary
library     String
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
        Fail    Unable to click element '${locator}': ${error}
    END




Verify Element Is Visible
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    Element '${locator}' was not visible within ${StandardWait}: ${error}
    END





Navigate To Page
    [Arguments]    ${navigationLocator}    ${destinationPageLocator}
    Safe Click    ${navigationLocator}
    TRY
        Wait Until Page Contains Element    ${destinationPageLocator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    Navigation failed — '${destinationPageLocator}' did not appear: ${error}
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





Compare Element Text
    [Arguments]    ${locator}    ${expectedText}
    ${actualText}=    Get Element Text    ${locator}
    TRY
        Should Be Equal    ${actualText}    ${expectedText}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    Text mismatch at '${locator}' — expected '${expectedText}' but got '${actualText}'
    END






















Verify Element Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${StandardWait}

Navigate To Page
    [Arguments]    ${navigationLocator}    ${destinationPageLocator}
    Click Element    ${navigationLocator}
    Wait Until Page Contains Element    ${destinationPageLocator}    ${StandardWait}

Get Element Text
    [Arguments]    ${locator}
    ${text}=    Get Text    ${locator}
    RETURN    ${text}


Compare Element Text
    [Arguments]    ${locator}    ${expectedText}
    Wait Until Element Is Visible    ${locator}    ${StandardWait}
    ${actualText}=    Get Element Text    ${locator}
    Should Be Equal    ${actualText}    ${expectedText}
