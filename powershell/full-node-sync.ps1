chia stop all -d
Start-Sleep -Seconds 30
chia start node
Write-Output "$(Get-Date)"
Start-Sleep -Seconds 30
$status = ""

while ($status -ne "Current Blockchain Status: Full Node Synced") {
    $status = 
        chia show -s 
        | Where-Object { $_ -like "Current Blockchain Status:*"}

    Write-Output "$(Get-Date): $status"
    Start-Sleep -Seconds 60
}
Write-Output $status
Start-Sleep -Seconds 60
chia stop all -d