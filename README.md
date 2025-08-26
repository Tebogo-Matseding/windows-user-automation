# Windows User Automation (PowerShell)

A PowerShell script that automates the creation of multiple Windows user accounts using a CSV file.  
This project was built to practice PowerShell automation and simplify bulk user management.  

## Features
- Creates multiple local Windows user accounts from a CSV file  
- Supports first name, last name, custom passwords, departments, and group assignments  
- Automatically adds users to local groups if they exist  
- Easy to extend for additional attributes (e.g., home directories)  

## Usage
1. Clone this repo  
2. Prepare a CSV file with the following format:  

   ```csv
   FirstName,LastName,Password,Department,Group
   Thabo,Mokoena,Welcome123!,Finance,Finance
   Aisha,Abdullah,Welcome123!,IT,IT
   John,Smith,Welcome123!,HR,HR
   Ling,Chen,Welcome123!,Sales,Sales
   Kwame,Nkrumah,Welcome123!,Finance,Finance
   Maria,Gonzalez,Welcome123!,IT,IT
   Akira,Yamamoto,Welcome123!,HR,HR
   Fatima,Khan,Welcome123!,Sales,Sales
