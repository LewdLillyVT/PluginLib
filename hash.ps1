# Prompt the user for the file path
param(
    [string]$FilePath
)

# Check if the file path is provided, if not prompt the user to enter it
if (-not $FilePath) {
    $FilePath = Read-Host "Enter the file path to hash"
}

# Verify that the file exists
if (!(Test-Path -Path $FilePath)) {
    Write-Output "Error: File not found at path '$FilePath'"
    exit 1
}

try {
    # Open the file and compute the SHA-256 hash
    $sha256 = [System.Security.Cryptography.SHA256]::Create()
    $fileStream = [System.IO.File]::OpenRead($FilePath)
    $hashBytes = $sha256.ComputeHash($fileStream)
    $fileStream.Close()

    # Convert hash bytes to a hexadecimal string
    $hashString = [BitConverter]::ToString($hashBytes) -replace "-", ""
    Write-Output "SHA-256 hash of the file is: $hashString"
} catch {
    Write-Output "Error: Failed to compute hash. $_"
    exit 1
}
