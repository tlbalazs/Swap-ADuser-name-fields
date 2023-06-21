# Author: Toth Laszlo Balazs
# Swaps the first name and last name, and sets the displayed name to the desired format.
#
#
# Where the users are located that you want to change (sub-OUs included)
$UsersOU = 'OU=OU_NAME,DC=contoso,DC=com'

# An array of the users (adjust Properties as needed)
$Users = Get-ADUser -Filter * -SearchBase $UsersOU -Properties GivenName, Surname
	
	# Loop through all the users in a specified OU
	foreach ($User in $Users)
	{ 
        	# Swapping the GivenName and Surname properties during filling variables (For correcting FN and LN fields)
		$firstName = $User.Surname
		$lastName = $User.GivenName

        	# Swapping the GivenName and Surname properties for the current user
        	Set-ADUser -Identity $User -GivenName "$firstName"
        	Set-ADUser -Identity $User -Surname "$lastName"
       
        	# Convert lastname to uppercase
        	$lastName = $lastName.ToUpper()	
		# The following line will adjust the DisplayName
		Set-ADUser -Identity $User -DisplayName "$lastName, $firstName"
		
		# The following line will adjust the CN if required
		#Rename-ADObject -Identity $User -NewName "$lastName, $firstName"
	}
