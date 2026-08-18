*** Settings ***
Library     SeleniumLibrary
Resource    ../../Config/Global_Variables.robot
Resource    BrowserKeyword.resource


*** Keywords ***

Verify Element Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    ${StandardWait}

Navigate To Page
    [Arguments]    ${navigationLocator}    ${destinationPageLocator}
    Click Button    ${navigationLocator}
    Wait Until Page Contains Element    ${destinationPageLocator}    ${StandardWait}

Get Element Text
    [Arguments]    ${locator}
    ${text}=    Get Text    ${locator}
    RETURN    ${text}


Compare Element Text
    [Arguments]    ${locator}    ${expectedText}
    ${actualText}=    Get Element Text    ${locator}
    Should Be Equal    ${actualText}    ${expectedText}
