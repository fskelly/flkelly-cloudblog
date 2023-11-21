<#
.SYNOPSIS
This script checks the deployment status of private clouds and monitors the provisioning process.

.DESCRIPTION
The script prompts the user to monitor a deployment or skip the deployment check. If the user chooses to monitor, it retrieves a list of private clouds and allows the user to select a private cloud to check the deployment status. It then continuously checks the provisioning status of the selected private cloud until it is no longer in the "Building" state.

.PARAMETER None

.INPUTS
None

.OUTPUTS
None

.EXAMPLE
.\deployment-check.ps1
Prompts the user to monitor a deployment and select a private cloud to check the deployment status.

.NOTES
Author: Your Name
Date: Current Date
#>

#deployment check
Write-Output "Waiting 60 seconds before checking deployment status"
Start-Sleep -s 60
$YesOrNo = Read-Host "Do you need to monitor a deployment (y/n)"
while("y","n" -notcontains $YesOrNo ) {
 $YesOrNo = Read-Host "Please enter your response (y/n)"
}
if ($YesOrNo -eq "y") {
    Write-Output "Monitoring deployment"
} else {
    Write-Output "Skipping deployment check"
    break
}


$privateClouds = Get-AzVMwarePrivateCloud
[int]$privateCloudCount = $privateClouds.count
Write-output "Found $privateCloudCount private clouds"

$i = 0
foreach ($privateCloud in $privateClouds)
{
  $cloudValue = $i
  $cloudText = [string]$cloudValue + " : " + $privateCloud.Name + " ( " + $privateCloud.ResourceGroupName + " )" + ":" + $privateCloud.Location
  Write-output $cloudText
  $i++
}
Do 
{
  [int]$privateCloudChoice = read-host -prompt "Select a private to check deployment & press enter"
} 
until ($privateCloudChoice -le $privateCloudCount)
$selectedprivateCloud = "You selected " + $privateClouds[$privateCloudChoice].Name
Write-output $selectedprivateCloud

$privateCloudRgName = $privateClouds[$privateCloudChoice].resourcegroupname
$privateCloudLocation = $privateClouds[$privateCloudChoice].location
$cloudName = $privateClouds[$privateCloudChoice].name
$privateCloud = Get-AzVMwarePrivateCloud -ResourceGroupName $privateCloudRgName -Name $cloudName


do {
    $privateCloud = Get-AzVMwarePrivateCloud -ResourceGroupName $privateCloudRgName -Name $cloudName
    $provisioningStatus = $privateCloud.provisioningState
    $timestamp = get-date -Format "dd-MM-yyyy - HH:mm:ss"
    switch ($provisioningStatus) {
        "Building" 
        {
            $statusMessage = "Provisioning status for $cloudName is : " +    $provisioningStatus + " ($timestamp)"
            Write-Output $statusMessage
            Start-Sleep -Seconds 300
       }
        "Succeeded"
        {
            $statusMessage = "Provisioning status for $cloudName is : " + $provisioningStatus + " ($timestamp)"
            Write-Output $statusMessage
            break
       }
        Default
        {
            Start-Sleep -Seconds 300
            $statusMessage = "Provisioning status for $cloudName is : " + $provisioningStatus + " ($timestamp)"
            Write-Output $statusMessage
        }
   }
} until ($provisioningStatus -ne "Building" )