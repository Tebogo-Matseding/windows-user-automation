# Import Active Directory module
Import-Module ActiveDirectory

# Departments
$departments = @("Finance", "IT", "HR", "Sales")

foreach ($dept in $departments) {
    $domainPath = "DC=yourdomain,DC=com"
    $ouPath = "OU=$dept,$domainPath"

    # Create OU if it doesn't exist
    if (-not (Get-ADOrganizationalUnit -Filter {Name -eq $dept} -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $dept -Path $domainPath
        Write-Output "Created OU: $dept"
    } else {
        Write-Output "OU $dept already exists."
    }

    # Create Security Group if it doesn't exist
    if (-not (Get-ADGroup -Filter {Name -eq $dept} -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $dept -GroupScope Global -Path $ouPath
        Write-Output "Created Security Group: $dept in $ouPath"
    } else {
        Write-Output "Group $dept already exists."
    }
}
