#!/bin/bash
echo -e "P@ssw0rd!23$\nP@ssw0rd!23$" | sudo passwd root

# This will delete the file after you're done so it doesn't store the password on the local system
# There are better ways to go about this, but this is just a proof of concept to remediate this particular vulnerability.

rm remediation-root-password.sh

# Download the script
# wget https://raw.githubusercontent.com/techgneek/Azure-Cloud-Infrastructure-Lab/refs/heads/main/remediation-root-password.sh --no-check-certificate

# Make the script executable:
# chmod +x remediation-root-password.sh

# Execute the script:
# ./remediation-root-password.sh
