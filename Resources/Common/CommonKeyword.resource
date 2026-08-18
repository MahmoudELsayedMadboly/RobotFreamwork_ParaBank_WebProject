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
        Capture Page Screenshot
        Fail    Unable to click element '${locator}': ${error}
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
