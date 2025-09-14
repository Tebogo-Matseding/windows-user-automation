param (
    [string]$CsvPath = ".\users.csv",
    [string]$DomainName = "yourdomain.com",
    [string]$OU = "OU=Users,DC=yourdomain,DC=com"
)

Import-Module ActiveDirectory

if (-Not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found at $CsvPath"
    exit
}

$users = Import-Csv -Path $CsvPath

foreach ($user in $users) {
    $username = "$($user.LastName)$($user.FirstName.Substring(0,1))".ToLower()
    $upn = "$username@$DomainName"
    $fullName = "$($user.FirstName) $($user.LastName)"

    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    try {
        New-ADUser `
            -Name $fullName `
            -SamAccountName $username `
            -UserPrincipalName $upn `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -DisplayName $fullName `
            -Department $user.Department `
            -AccountPassword $password `
            -Path $OU `
            -Enabled $true `
            -ChangePasswordAtLogon $true

        Write-Output "User $upn created successfully."
    }
    catch {
        Write-Warning "Could not create user $upn. Error: $_"
    }
}
