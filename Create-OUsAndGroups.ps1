# Import Active Directory module
Import-Module ActiveDirectory

# Departments
$departments = @("Finance", "IT", "HR", "Sales")

foreach ($dept in $departments) {
    # Create OU
    $ouName = "OU=$dept,DC=yourdomain,DC=com"  # Replace with your domain
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$dept'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $dept -Path "DC=yourdomain,DC=com"
        Write-Output "Created OU: $dept"
    }

    # Create Security Group
    if (-not (Get-ADGroup -Filter "Name -eq '$dept'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $dept -GroupScope Global -Path $ouName
        Write-Output "Created Security Group: $dept"
    }
}
