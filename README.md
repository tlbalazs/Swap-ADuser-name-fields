## PowerShell Script Documentation: User Name Update

This PowerShell script is designed to update the names of users in a specified Organizational Unit (OU) in Active Directory. The script performs the following actions:

1. **Specify the Target OU**: The variable `$UsersOU` should be set to the distinguished name (DN) of the OU where the users to be modified are located. For example: `OU=OU_NAME,DC=contoso,DC=com`. Adjust this value to match the desired OU in your environment.

2. **Retrieve User Information**: The script utilizes the `Get-ADUser` cmdlet to retrieve user objects from the specified OU. The `-Filter *` parameter ensures all users are included. Additional properties such as `GivenName` and `Surname` are retrieved using the `-Properties` parameter. Adjust the properties as needed for your specific requirements.

3. **User Name Update Loop**: The script then enters a loop to process each user retrieved in the previous step. The loop structure is as follows:

   a. **Swapping GivenName and Surname**: The user's first name (`GivenName`) and last name (`Surname`) properties are swapped and stored in the `$firstName` and `$lastName` variables. This step corrects any inconsistencies between the first and last name fields.

   b. **Update GivenName and Surname**: The `Set-ADUser` cmdlet is used to update the `GivenName` and `Surname` properties of the current user with the corrected values stored in the variables `$firstName` and `$lastName`, respectively.

   c. **Update DisplayName**: The `DisplayName` property of the user is adjusted using the `Set-ADUser` cmdlet. The new value is set as "$lastName, $firstName" to reflect the corrected name order.

   d. **Update CN (Optional)**: If desired, the script can also update the Common Name (CN) property of the user by uncommenting the `Rename-ADObject` line. This line uses the `Rename-ADObject` cmdlet to rename the user object, setting the new name as "$lastName, $firstName".

4. **Convert Last Name to Uppercase**: The `$lastName` variable is then converted to uppercase using the `ToUpper()` method. This is an optional step and can be removed if not needed.

Please ensure that you have the necessary permissions to modify user objects in Active Directory before running this script. It is recommended to test the script in a non-production environment before applying it to your live environment.

Remember to save the script with a .ps1 extension (e.g., `UpdateUserNames.ps1`) and execute it using an account with appropriate privileges in a PowerShell environment.
