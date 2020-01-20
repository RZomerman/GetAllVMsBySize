# Get All VM's By Size

This Repo Contains a PoweeShell script to get the number of VM's by size in an Azure Subscription

## Prerequisites

- [Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)

## Usage

### Sign In

```powershell
Connect-AzAccount
```

### Run PowerShell Script

```powershell
 ./GetVMSizes.ps1
```

# Sample Output

```Powershell
Subscription: Subscription A (xxxxxx-xxxxxx-xxxxxx-xxxxxx)

Standard_B1ms: 1
Standard_B1s: 4
Standard_D2s_v3: 2

Subscription:  Subscription B (xxxxxx-xxxxxx-xxxxxx-xxxxxx)

Standard_NV6: 1


all sizes in all subsciptions:

Name                           Value
----                           -----
Standard_B1s                   4
Standard_NV6                   1
Standard_B1ms                  1
Standard_D2s_v3                2

```
