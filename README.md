# Windows User & AD Automation (PowerShell)

This repository contains PowerShell scripts that automate user management on Windows systems and Active Directory environments.  
It was built to practice PowerShell automation and simplify bulk administration tasks.

## Features

### 1. Local User Creation
- Creates multiple local Windows user accounts from a CSV file  
- Supports first name, last name, custom passwords, departments, and group assignments  
- Automatically adds users to local groups if they exist  

### 2. OU and Security Group Creation (Active Directory)
- Creates Organizational Units (OUs) for Finance, IT, HR, and Sales  
- Creates matching Security Groups in each OU  
- Easy to extend for additional departments or groups  

### How the Scripts Work Together
1. **OU & Group script** creates the structure in Active Directory (OUs and security groups).  
2. **User creation script** reads from a CSV and creates users, placing them into the correct OU or local group depending on environment.  
3. This allows full automation of onboarding: from department structure setup to user provisioning.

---

## Prerequisites

Before running the scripts:

- **For Local User Creation** (`Create-Users.ps1`):  
  - Windows PowerShell 5.1 or later  
  - Script must be run as an administrator  
  - Optional: pre-create any local groups if you want users added automatically  

- **For AD OU & Group Creation** (`Create-OUsAndGroups.ps1`):  
  - Active Directory environment  
  - RSAT tools installed (`ActiveDirectory` module)  
  - Domain admin or sufficient privileges to create OUs and groups  
  - Update the script with your domain (replace `"DC=yourdomain,DC=com"`)

---

## Usage

### Local User Automation
1. Prepare a CSV file (`users.csv`) with this format:

```csv
FirstName,LastName,Password,Department
John,VanDerMerwe,P@ssw0rd,Finance
Sophie,Botha,P@ssw0rd,Finance
Sipho,Mkhize,P@ssw0rd,Finance
Aisha,Naidoo,P@ssw0rd,Finance
Connor,Smith,P@ssw0rd,Finance

James,DeVilliers,P@ssw0rd,IT
Lara,Pretorius,P@ssw0rd,IT
Thabo,Ndlela,P@ssw0rd,IT
Priya,Naidoo,P@ssw0rd,IT
David,Adams,P@ssw0rd,IT

Emma,VanZyl,P@ssw0rd,HR
Pieter,Jansen,P@ssw0rd,HR
Nkosi,Khumalo,P@ssw0rd,HR
Anisha,Patel,P@ssw0rd,HR
Claire,Fourie,P@ssw0rd,HR

Michael,VanRensburg,P@ssw0rd,Sales
Elise,DuToit,P@ssw0rd,Sales
Siphelele,Zuma,P@ssw0rd,Sales
Ria,Naidoo,P@ssw0rd,Sales
Liam,Coetzee,P@ssw0rd,Sales

Hannah,VanNiekerk,P@ssw0rd,Marketing
Stefan,Botha,P@ssw0rd,Marketing
Thandi,Zulu,P@ssw0rd,Marketing
Reena,Maharaj,P@ssw0rd,Marketing
Mark,Smith,P@ssw0rd,Marketing

