*** Settings ***
Resource    ../Resources/Common/BrowserKeyword.resource
resource    ../Resources/Pages/HomePage.resource
resource    ../Resources/Pages/Login.resource
resource    ../Resources/Common/SetupFlows/CreateUserFlow.resource
resource    ../TestData/Update_Profile_Info_Data.robot
resource    ../Resources/Pages/Update_Contact_Info.resource


suite Setup     Register Fresh User And Store Credentials
suite Teardown    Close Application Browser

Test Setup       Initialize Browser And Login    
...    ${REGISTERED_USERNAME}    
...    ${REGISTERED_PASSWORD}
Test Teardown    Close Application Browser


*** Test Cases ***

TC_PROFILE_UPDATE_001: Verify User Can Update Profile Details Successfully
    [Documentation]    This test case verifies that a user can successfully update their profile details on the Update Contact Info page.
    [Tags]    Regression

    Navigate To Update Contact Info Page

    Update First Name Field    ${New_FirstName}

    hit Update Profile Button

    Sleep    20s

    verify Profile Update Success    



   
TC_PROFILE_UPDATE_002: Verify Update Fails With Invalid Data
    [Documentation]    This test case verifies that user can not update their profile details on the Update Contact Info page when insert invalid data.
    [Tags]    Regression

    Navigate To Update Contact Info Page

    #here consider null value is the invalid data & the parabank accept any passed values except for null value
    Clear First Name Field 

    hit Update Profile Button

    Sleep    20s

    Verify Validation Message Is Displayed