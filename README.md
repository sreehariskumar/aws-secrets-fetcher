# aws-secrets-fetcher


```s
git clone https://github.com/sreehariskumar/aws-secrets-fetcher.git
cd aws-secrets-fetcher/
chmod +x aws-secrets-fetcher.sh
./aws-secrets-fetcher.sh
```

This script does the following tasks:

- It sets three variables: your_secret_name, your_secret_region, and your_password_key, which should be replaced with actual values.

- It detects the operating system running on the machine and assigns a value to the **OS** variable accordingly. Here's how it works:

_The if statement checks if the output of the **uname -s** command is equal to "Linux". If it is, that means the script is running on a Linux system. If it isn't, the script prints an error message and exits._

_If the script is running on a Linux system, the **if** statement checks if the **/etc/os-release** file contains the string **"Ubuntu"**. If it does, the script assigns the value **"ubuntu"** to the OS variable. If it doesn't, the **elif** statement checks if the file contains the string **"CentOS"**. If it does, the script assigns the value **"centos"** to the OS variable. If neither string is found, the **else** statement prints an error message and exits._


- It installs the required packages based on the detected OS. If the OS is Ubuntu, the script uses **apt-get** to update the package cache and install the **jq, unzip, and curl** packages. If the OS is CentOS, the script uses **yum** to update the package cache and install the same packages.

- It downloads and installs the **AWS CLI tool**.

- It fetches a secret from the **AWS Secrets Manager** by calling the **aws secretsmanager get-secret-value** command with the **--secret-id** and **--region** options set to the values of the **your_secret_name** and **your_secret_region** variables, respectively. It then pipes the output through several commands to filter out the desired password value from the JSON response.

_Note that in order to use this script, you will need to replace the placeholder values for the **your_secret_name**, **your_secret_region**, and **your_password_key** variables with the actual values for your AWS Secrets Manager secret._
