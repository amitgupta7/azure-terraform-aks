# azure-terraform-aks
Deploy and destroy aks with terraform. Provided as-is. 

Create a `terraform.tfvars` file to proivide azure subscription id, existing resource group And/Or other inputs to the script. See `var.tf` file for more details. e.g.
```hcl
az_subscription_id = "your-azure-subscription-id"
az_resource_group  = "existing-resource-group-in-azure"
az_name_prefix     = "unique-prefix-to-use-in-resource-names"
```

NOTE: These are mac instructions (homebrew --> azure cli --> terraform --> aks). 
```shell
#install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## install terraform
brew install terraform
## install az cli
brew install azure-cli
## install aks kubernetes client
sudo az aks install-cli
## login to azure cli
az login
## obtain this repo
git clone https://github.com/amitgupta7/azure-terraform-aks.git
cd azure-terraform-aks
source tfAlias
source kAlias
## initialize terraform
tf init
tfaa
## Check if kubectl command is working with aks
kg nodes
# + kubectl get nodes
# NAME                             STATUS   ROLES   AGE     VERSION
# aks-system-31285995-vmss000000   Ready    agent   3m51s   v1.24.10
# aks-system-31285995-vmss000001   Ready    agent   3m55s   v1.24.10
## clean-up
tfda
```
