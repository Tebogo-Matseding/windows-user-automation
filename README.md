# Windows User Automation (PowerShell)

A PowerShell script that automates the creation of multiple Windows user accounts using a CSV file.  
This project was built to practice PowerShell automation and simplify bulk user management.  

## Features
- Creates multiple local Windows user accounts from a CSV file  
- Supports custom usernames and passwords  
- Easy to extend for additional attributes (e.g., groups, home directories)  

## Usage
1. Clone this repo  
2. Prepare a CSV file with the following format:  

   ```csv
   Username,Password
   user1,Password123!
   user2,Password456!
