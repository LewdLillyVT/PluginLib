# get-diskinfo.ps1

# Get disk information
$disks = Get-PSDrive -PSProvider FileSystem

# Check if any disks were found
if ($disks.Count -eq 0) {
    Write-Host "No disks found."
    exit 1
}

# Display disk information
Write-Host "Drive Information:"
foreach ($disk in $disks) {
    $usedSpace = [math]::round($disk.Used / 1GB, 2)
    $freeSpace = [math]::round($disk.Free / 1GB, 2)
    $totalSpace = [math]::round($disk.Used / 1GB + $disk.Free / 1GB, 2)
    
    Write-Host "Drive: $($disk.Name)"
    Write-Host "  Total Size: ${totalSpace} GB"
    Write-Host "  Used Space: ${usedSpace} GB"
    Write-Host "  Free Space: ${freeSpace} GB"
    Write-Host "----------------------------------------"
}
