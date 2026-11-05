

3. Account Overview

TC_ACC_001: Verify Accounts List Displays After Login

1- Log in with valid, registered credentials
2- Navigate to / land on Accounts Overview page
3- Verify the "Accounts Overview" header is visible
4- Verify at least one account row is displayed in the accounts table
5- Verify each row displays: Account ID, Balance, Available Amount

TC_ACC_002: Verify Account Balance Displayed Correctly

1- Log in with valid credentials
2- Note the account balance shown on Accounts Overview
3- Click into the account (via account ID link) to view Account Activity/details
4- Verify the balance shown on the details page matches the balance shown on Accounts Overview




5. Transfer Funds (in progress)
-------------------------------
TC_TRANSFER_001: Verify Successful full Transfer Between Own Accounts

1-Log in with valid credentials
2-Note the balance of Account A (from account) and Account B (to account)
3-Navigate to "Transfer Funds" page
4-Enter a valid transfer amount
5-Select Account A as "From Account"
6-Select Account B as "To Account"
7-Click "Transfer" button
8-Verify confirmation message is displayed (e.g., "Transfer Complete!")
9-Navigate to Accounts Overview
10-Verify Account A's balance decreased by the transferred amount
11-Verify Account B's balance increased by the transferred amount

TC_TRANSFER_002: Verify Successful partial Transfer Between Own Accounts

TC_TRANSFER_003: Verify Transfer Fails When Amount Exceeds Available Balance (if ParaBank validates this — needs confirming on the live site)

Log in with valid credentials
Navigate to "Transfer Funds" page
Enter an amount greater than the "From Account" balance
Select From/To accounts
Click "Transfer"
Verify an appropriate error/validation message is displayed
Verify no balance change occurred on either account


6. Bill Pay
------------

TC_BILLPAY_001: Verify Successful Bill Payment

1- Log in with valid credentials
2- Navigate to "Bill Pay" page
3- Enter payee details: name, address, city, state, zip, phone, account number (confirm account number)4- nter payment amount
4- Select "From Account"
5- Click "Send Payment"
6- Verify confirmation message is displayed (e.g., "Bill Payment Complete")
7- Verify payment amount and payee name shown in confirmation
8-Navigate to Account Activity for the "From Account"
9- Verify the bill payment transaction appears in the transaction history

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


