# aws-secrets-fetcher

This script does the following tasks:

- It sets three variables: your_secret_name, your_secret_region, and your_password_key, which should be replaced with actual values.

- It detects the operating system running the script by checking the value of the **uname -s** command. If it is Linux, the script checks for the presence of a file named **/etc/lsb-release**. If this file exists, the script assumes the OS is **Ubuntu**. If not, it checks for the presence of a file named **/etc/redhat-release**. If this file exists, the script assumes the OS is **CentOS**. If neither of these files exists, the script prints an error message and exits.

- It installs the required packages based on the detected OS. If the OS is Ubuntu, the script uses **apt-get** to update the package cache and install the **jq, unzip, and curl** packages. If the OS is CentOS, the script uses **yum** to update the package cache and install the same packages.

- It downloads and installs the **AWS CLI tool**.

- It fetches a secret from the **AWS Secrets Manager** by calling the **aws secretsmanager get-secret-value** command with the **--secret-id** and **--region** options set to the values of the **your_secret_name** and **your_secret_region** variables, respectively. It then pipes the output through several commands to filter out the desired password value from the JSON response.

_Note that in order to use this script, you will need to replace the placeholder values for the **your_secret_name**, **your_secret_region**, and **your_password_key** variables with the actual values for your AWS Secrets Manager secret._





