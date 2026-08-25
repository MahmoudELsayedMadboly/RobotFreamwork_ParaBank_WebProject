1- User Registration
--------------------
TC_REG_001: Verify User Registration With Valid Data

1-Navigate to the homepage
2-Click "Register" link
3-Enter First Name, Last Name, Address, City, State, Zip Code, Phone, SSN
4-Enter a unique Username
5-Enter Password and Confirm Password (matching)
6-Click "Register" button
7-Verify "Welcome [username]" header and success message are displayed
8-Verify the user is automatically logged in (redirected to Accounts Overview)

TC_REG_002: Verify Duplicate Username Registration Is Rejected

1-Navigate to the homepage
2-Click "Register" link
3-Fill in the registration form using a username that already exists
4-Fill remaining fields with valid data
5-Click "Register" button
6-Verify a duplicate-username validation error is displayed
7-Verify no new account was created


2- Login
--------
TC_LOGIN_001: Verify Login With Valid Credentials

Navigate to the homepage
Enter a valid, registered username and password
Click "Log In" button
Verify "Accounts Overview" header is displayed
Verify the user's account(s) are listed

TC_LOGIN_002: Verify Login Fails With Invalid Credentials

Navigate to the homepage
Enter an incorrect username and/or password
Click "Log In" button
Verify an appropriate error message is displayed
Verify the user remains on the login page (not redirected to Accounts Overview)

TC_LOGIN_003: Verify Login Fails With Empty Username/Password

Navigate to the homepage
Leave username and password fields empty
Click "Log In" button
Verify a validation message is displayed (e.g., "Please enter a username and password.")
Verify the user remains on the login page

3. Account Overview

TC_ACC_001: Verify Accounts List Displays After Login

Log in with valid, registered credentials
Navigate to / land on Accounts Overview page
Verify the "Accounts Overview" header is visible
Verify at least one account row is displayed in the accounts table
Verify each row displays: Account ID, Balance, Available Amount

TC_ACC_002: Verify Account Balance Displayed Correctly

Log in with valid credentials
Note the account balance shown on Accounts Overview
Click into the account (via account ID link) to view Account Activity/details
Verify the balance shown on the details page matches the balance shown on Accounts Overview


4- Open New Account (in progress)
-------------------
TC_OPEN_001: Verify User Can Open a New Checking Account

1-Log in with valid credentials
2-Navigate to "Open New Account" page
3-Select account type = CHECKING
4-Select an existing account to fund from (From Account dropdown)
5-Click "Open New Account" button
6-Verify "Account Opened!" success message is displayed
7-Verify a new account number is shown
8-Navigate back to Accounts Overview
9-Verify the newly created account ID appears in the accounts list

TC_OPEN_002: Verify User Can Open a New Savings Account
Same steps as TC_OPEN_001, with account type = SAVINGS.

5. Transfer Funds

TC_TRANSFER_001: Verify Successful Transfer Between Own Accounts

Log in with valid credentials
Note the balance of Account A (from account) and Account B (to account)
Navigate to "Transfer Funds" page
Enter a valid transfer amount
Select Account A as "From Account"
Select Account B as "To Account"
Click "Transfer" button
Verify confirmation message is displayed (e.g., "Transfer Complete!")
Navigate to Accounts Overview
Verify Account A's balance decreased by the transferred amount
Verify Account B's balance increased by the transferred amount

TC_TRANSFER_002: Verify Transfer Fails When Amount Exceeds Available Balance (if ParaBank validates this — needs confirming on the live site)

Log in with valid credentials
Navigate to "Transfer Funds" page
Enter an amount greater than the "From Account" balance
Select From/To accounts
Click "Transfer"
Verify an appropriate error/validation message is displayed
Verify no balance change occurred on either account
6. Bill Pay

TC_BILLPAY_001: Verify Successful Bill Payment

Log in with valid credentials
Navigate to "Bill Pay" page
Enter payee details: name, address, city, state, zip, phone, account number (confirm account number)
Enter payment amount
Select "From Account"
Click "Send Payment"
Verify confirmation message is displayed (e.g., "Bill Payment Complete")
Verify payment amount and payee name shown in confirmation
Navigate to Account Activity for the "From Account"
Verify the bill payment transaction appears in the transaction history

TC_BILLPAY_002: Verify Bill Pay Fails With Missing Required Fields

Log in with valid credentials
Navigate to "Bill Pay" page
Leave one or more required fields empty (e.g., payee name)
Click "Send Payment"
Verify validation error message is displayed for the missing field(s)
Verify no payment was processed
7. Find Transactions

TC_FINDTXN_001: Verify Search By Transaction ID Returns Correct Result

Log in with valid credentials
Perform an action that generates a transaction (e.g., transfer funds) and note the transaction ID
Navigate to "Find Transactions" page
Enter the known transaction ID
Click search
Verify the correct transaction is returned, with matching amount/date

TC_FINDTXN_002: Verify Search By Date Range Returns Correct Results

Log in with valid credentials
Navigate to "Find Transactions" page
Enter a date range covering a known transaction
Click search
Verify all returned transactions fall within the specified date range

TC_FINDTXN_003: Verify Search By Amount Returns Correct Results

Log in with valid credentials
Navigate to "Find Transactions" page
Enter a known transaction amount
Click search
Verify the returned transaction(s) match the specified amount
8. Update Contact Info

TC_UPDATE_001: Verify User Can Update Profile Details Successfully

Log in with valid credentials
Navigate to "Update Contact Info" page
Verify current profile details are pre-populated correctly
Update address, phone number, and email fields with new values
Click "Update Profile" / "Save" button
Verify a success confirmation message is displayed
Navigate away and back to "Update Contact Info"
Verify the updated values persisted correctly

TC_UPDATE_002: Verify Update Fails With Invalid Data (e.g., invalid phone format, if validated)

Log in with valid credentials
Navigate to "Update Contact Info" page
Enter invalid data in a validated field (e.g., malformed phone number)
Click "Update Profile"
Verify an appropriate validation error is displayed
Verify original data was not overwritten
9. Request Loan

TC_LOAN_001: Verify Loan Request Is Approved (Sufficient Funds)

Log in with valid credentials
Navigate to "Request Loan" page
Enter a loan amount and a down payment amount that meets approval criteria
Select an account to apply the loan to
Click "Apply Now"
Verify the response shows "Approved" status
Navigate to Accounts Overview
Verify a new loan account appears (if approved accounts are auto-created)

TC_LOAN_002: Verify Loan Request Is Denied (Insufficient Down Payment)

Log in with valid credentials
Navigate to "Request Loan" page
Enter a loan amount with an insufficient down payment
Click "Apply Now"
Verify the response shows "Denied" status
10. Logout

TC_LOGOUT_001: Verify Successful Logout

Log in with valid credentials
Verify Accounts Overview is displayed (confirms logged in)
Click "Log Out" link
Verify user is redirected to the homepage/login screen
Verify the login form (username/password fields) is visible again

TC_LOGOUT_002: Verify Session Ends After Logout

Log in, then log out (as above)
Attempt to navigate directly to an authenticated page (e.g., Accounts Overview URL) via browser address bar
Verify the user is redirected to login instead of seeing account data