# Variables when executing from PowerShell
$SubscriptionName = "Visual Studio Professional Subscription"
$RGName = "rg-az204-azwindows-dev-001"
$LocationName = "EastUS"
$BaseName = "vmapr2021"
$VmName = "win$($BaseName)" ##### Windows computer name cannot be more than 15 characters long
$PortToOpen = 80
$username = "demouser"
$ImageName = "Win2019Datacenter" 

##### Variables when executing from Bash Shell
SubscriptionName="Visual Studio Professional Subscription"
RGName="rg-az204-azwindows-dev-001"
LocationName="EastUS"
BaseName="vmapr2021"
VmName="win$(echo $BaseName)" 
PortToOpen=80
username="demouser"
password="NoPassword@123$%^&*"
ImageName="Win2019Datacenter" 

##### Login
az login
az account set --subscription $SubscriptionName
az account list --output table
az account show

###### Group
az group list --output table
az group create --name $RGName --location $LocationName

##### Virtual Machine
## In PowerShell
az vm create --resource-group $RGName --name $VmName --image $ImageName --authentication-type password --admin-username $username 

## In Bash Shell
az vm create --resource-group $RGName --name $VmName --image $ImageName --authentication-type password --admin-username $username --admin-password $password

##### Opending the ports
az vm open-port --resource-group $RGName --name $VmName --port $PortToOpen --priority 900

##### IP Addresses for Remote Access
az vm list-ip-addresses --resource-group $RGName --name $VmName --output table

##### Connect to Windows VM using RPD
mstsc /v:publicIpAddress

##### From Within the newly created VM
PS > Install-WindowsFeature -name Web-Server -IncludeManagementTools

az group delete -n $RGName

##### **************************
