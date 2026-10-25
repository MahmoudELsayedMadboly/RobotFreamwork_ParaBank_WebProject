*** Settings ***
Resource    ../Resources/Common/BrowserKeyword.resource
resource    ../Resources/Pages/HomePage.resource
resource    ../Resources/Pages/Login.resource


Test Setup       Initialize Browser And Login
Test Teardown    Close Application Browser


*** Test Cases ***

TC_001_Verify Successful Partial Transfer Between Own Accounts


TC_002_Verify Successful Full Transfer Between Own Accounts


TC_003_Verify Transfer Fails When Amount Exceeds Available Balance