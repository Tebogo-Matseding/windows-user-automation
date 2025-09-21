param (
    [string]$CsvPath = ".\users.csv",
    [string]$DomainName = "yourdomain.com",
    [string]$DomainPath = "DC=yourdomain,DC=com"   # Change for your domain
)

# Import the Active Directory module
Import-Module ActiveDirectory

# Check if CSV exists
if (-Not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found at $CsvPath"
    exit
}

# Import users from CSV
$users = Import-Csv -Path $CsvPath

foreach ($user in $users) {
    # Build username (LastName + FirstInitial)
    $username = "$($user.LastName)$($user.FirstName.Substring(0,1))".ToLower()
    $upn = "$username@$DomainName"
    $fullName = "$($user.FirstName) $($user.LastName)"

    # Define OU Path from Department
    $ouPath = "OU=$($user.Department),$DomainPath"

    # Convert password to secure string
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    try {
        # Create AD User
        New-ADUser `
            -Name $fullName `
            -SamAccountName $username `
            -UserPrincipalName $upn `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -DisplayName $fullName `
            -Department $user.Department `
            -AccountPassword $password `
            -Path $ouPath `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Write-Output "User $upn created successfully in $ouPath."

        # Add user to matching security group
        $groupName = $user.Department
        if (Get-ADGroup -Filter "Name -eq '$groupName'" -ErrorAction SilentlyContinue) {
            Add-ADGroupMember -Identity $groupName -Members $username
            Write-Output "User $upn added to group $groupName."
        } else {
            Write-Warning "Group $groupName not found. User $upn was not added to a group."
        }
    }
    catch {
        Write-Warning "Could not create user $upn. Error: $_"
    }
}
