A simple Bash script that automates directory backups using ZIP compression.  
The script generates timestamped backup files and supports backup rotation logic.

---

## Features

-  Takes source and destination as arguments
-  Generates timestamped backups
-  Automatically creates backup directory if not present
-  Basic success/failure validation
-  Supports backup rotation (latest backups tracking)

---

##  Requirements

- Linux (Ubuntu recommended)
- Bash
- zip utility

---

##  How to Use

1. Clone this repository
   
         git clone 
         cd 

2. Give execute permission
 
         chmod +x backup.sh

3. Run the script

         ./backup.sh <source_directory> <backup_directory>

---
