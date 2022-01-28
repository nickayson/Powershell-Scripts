[cmdletbinding()]
Param (
    [Parameter(Mandatory=$True, HelpMessage="Enter a computername to query")]
    [alias('hostname')]
    [string]$Computername
    )
    Write-Verbose "Getting physical network adapters from $computername" -Verbose
    Get-WmiObject -Class win32_networkadapter -computername $Computername |
     where { $_.PhysicalAdapter } |
     select MACAddress,AdapterType,DeviceID,Name,Speed

     Write-Verbose "Script Finised." -Verbose