*** Settings ***
Library     SeleniumLibrary
Resource    ../../Config/Global_Variables.robot


*** Keywords ***

Initialize Browser
    [Arguments]    ${url}=${URL}    ${browser}=${BROWSER}
    TRY
        Open Browser    ${url}    ${browser}   
        Maximize Browser Window
        Wait Until Keyword Succeeds    ${StandardWait}    ${PingTime}
        ...    Execute Javascript    return document.readyState=="complete"
    EXCEPT    AS    ${error}
        Fail    The issue is: Failed to initialize browser session (url=${url}, browser=${browser}): ${error}
    END



Close Application Browser
    [Documentation]    Closes the browser and ends the session
    TRY
        Close All Browsers
    EXCEPT    AS    ${error}
        Log    Browser close encountered an issue (session may already be closed): ${error}    level=WARN
    END
