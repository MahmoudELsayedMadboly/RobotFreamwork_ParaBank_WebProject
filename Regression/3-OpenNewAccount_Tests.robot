*** Settings ***
Resource    ../Resources/Common/BrowserKeyword.resource
Resource    ../Resources/Pages/Register.resource
Resource    ../TestData/Registration_Data.robot
Resource    ../TestData/Login_Data.robot
resource    ../Resources/Pages/HomePage.resource
resource    ../Resources/Pages/Login.resource
Resource    ../TestData/Open_Account_Data.robot

Test Setup       Initialize Browser And Login
#Test Teardown    Close Application Browser


*** Test Cases ***

TC_001_Open A New Checking Account


    Navigate To Open New Account Page

    Open New Account    
    ...    ${CHECKING}    
    ...    ${AccountIdIndex}
    
    

    Verify The New Account Created Successfully    
    ...    ${Open_Account_Expected_Success_Message}


    ${AccountID}=    Verify The New Account Number Is Shown

    Navigate To Account Overview Page

    Verify New Opened Account Appears In Accounts Table    
    ...    ${AccountID}   

        


TC_002_Open A New Saving Account


    Navigate To Open New Account Page

    Open New Account    
    ...    ${SAVINGS}    
    ...    ${AccountIdIndex}


    Verify The New Account Created Successfully    
    ...    ${Open_Account_Expected_Success_Message}


    ${AccountID}=    Verify The New Account Number Is Shown

    Navigate To Account Overview Page

    Verify New Opened Account Appears In Accounts Table    
    ...    ${AccountID} 

    

    