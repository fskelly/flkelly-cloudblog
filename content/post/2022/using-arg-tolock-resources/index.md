---
title: "Using Azure Resource Graph and Tags to lock items in Azure"
date: 2022-10-03T13:59:06+01:00
Description: ""
Tags: []
Categories: []
DisableComments: false
---
Create sample items
```powershell
## create resource group
$rgName = "toberesourcelocked"
$rgLocation = "northeurope"
$rg = new-azresourcegroup -name $rgname -location $rgLocation

## create items
$guid = New-Guid
$saName = "sa"
$saSuffix = $guid.ToString().Split("-")[0]+$guid.ToString().Split("-")[1]
$saName = (($saName.replace("-",""))+$saSuffix)
New-AzStorageAccount -ResourceGroupName $rgName -Name $saName -Location $rgLocation -AccountType Standard_LRS

## create tag(s)
$tags = @{"toBeLocked"="Yes"}

## get items in Resource Group and tag them
$items = Get-AzResource -ResourceGroupName $rgName
foreach ($item in $items)
{
    Update-AzTag -ResourceId $item.ResourceId -Tag $tags -Operation Replace
} 
## update resource group with tag(s)
Update-AzTag -ResourceId $rg.ResourceId -Tag $tags -Operation Replace

```



Create ARG query

## Inlcuding Resource Groups

```azurecli
resourcecontainers
| where type == "microsoft.resources/subscriptions/resourcegroups"
| mv-expand bagexpansion=array tags
| where isnotempty(tags)
| where tags[0] =~ 'toBeLocked' and tags[1] =~ 'Yes'
| project  name,type,location,subscriptionId,tags
| union (resources 
| mv-expand bagexpansion=array tags
| where isnotempty(tags)
| where tags[0] =~ 'toBeLocked' and tags[1] =~ 'Yes'
| project name,type,location,subscriptionId,tags)
```

## Exlcuding Resource Groups

```azurecli
ResourceContainers
| where type =~ 'microsoft.resources/subscriptions/resourcegroups'
| where tags['toBeLocked'] =~ 'Yes'
```

Run ARG query
Act on ARG Query
