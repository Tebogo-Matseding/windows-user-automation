param (
    [string]$CsvPath = ".\users.csv"
)

# Check if CSV exists
if (-Not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found at $CsvPath"
    exit
}

# Import users from CSV
$users = Import-Csv -Path $CsvPath

foreach ($user in $users) {
    $username = "$($user.FirstName).$($user.LastName)"
    $fullName = "$($user.FirstName) $($user.LastName)"
    $password = $user.Password | ConvertTo-SecureString -AsPlainText -Force
    $department = $user.Department
    $group = $user.Group

    try {
        # Create local user
        New-LocalUser -Name $username -Password $password -FullName $fullName -Description "Created via automation script"
        Write-Output "User $username created successfully."

        # Add user to local group (if group exists)
        if (Get-LocalGroup -Name $group -ErrorAction SilentlyContinue) {
            Add-LocalGroupMember -Group $group -Member $username
            Write-Output "User $username added to group $group."
        } else {
            Write-Warning "Group $group does not exist. User $username was not added."
        }
    }
    catch {
        Write-Warning "Could not create user $username. Error: $_"
    }
}
