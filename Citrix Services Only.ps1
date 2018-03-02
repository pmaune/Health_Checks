$Servers = @("ctrx-ddc5","ctrx-ddc6","ctrx-lic2","ctrx-sf5","ctrx-sf6","PVS3","PVS4","AzureMFA")

forEach($Server in $Servers) {
    Get-Service -ComputerName $Server |
    ? {$_.starttype -like "*automatic*" -and $_.status -ne "Running" -and ($_.displayname -like "*citrix*" -or $_.displayname -like "*federation*")} |
    select machinename,name,displayname,status,starttype | sort starttype | ft -AutoSize
}