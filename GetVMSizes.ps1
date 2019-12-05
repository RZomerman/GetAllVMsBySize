
Function Get-AzVMsBySize {
    Param (
        [parameter()]
        $allSubscriptions
    )   
    $AllVMs=get-azvm
    foreach ($VM in $AllVMs) {
        $VMSizes=$null
        $VMSizes = New-Object System.Collections.ArrayList
        $supressdisplay=$VMSizes.Add($vm.HardwareProfile.VmSize)
        If ($allSubscriptions) {
            $supressdisplay=$AllSubscriptionVMs.Add($vm.HardwareProfile.VmSize)
        }
    }

        If ($vm.count -gt 1) {
            $UniqueSizes=$VMSizes | sort -Unique
            Foreach ($UniqueSize in $UniqueSizes) {
                $VMofSize=$AllVMs | where {$_.HardwareProfile.VmSize -eq $UniqueSize}
                Write-Host ($UniqueSize +": " + $VMofSize.count)
            }
    }
}


$AllSubscriptionVMs = New-Object System.Collections.ArrayList
$Subscriptions=Get-AzContext -ListAvailable

Foreach ($subscription in $Subscriptions) {
    write-host ""
    Write-host ("Subscription: " + $subscription.Name) -ForegroundColor Green
    $context=Set-AzContext -Subscription $Subscription.subscription
    Get-AzVMsBySize -allSubscriptions $true

    write-host "all sizes in all subsciptions:"
    $AllSubscriptionVMs | group | % { $h = @{} } { $h[$_.Name] = $_.Count } { $h }
}
