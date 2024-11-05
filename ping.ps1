# Prompt for the target host
$targetHost = Read-Host "Enter the hostname or IP address to ping"

# Check if the target host is provided
if (-not $targetHost) {
    Write-Host "You must enter a valid hostname or IP address."
    exit 1
}

# Try to ping the target host
try {
    $pingResult = Test-Connection -ComputerName $targetHost -Count 2 -ErrorAction Stop
    Write-Host "Ping results for ${targetHost}:"
    $pingResult | ForEach-Object { Write-Host "$($_.Address): $($_.ResponseTime) ms" }
} catch {
    Write-Host "Failed to ping $targetHost. Please check the hostname or IP address."
    exit 1
}

# ping.ps1 by LewdLillyVT
# https://github.com/LewdLillyVT/PluginLib
# An example plugin 