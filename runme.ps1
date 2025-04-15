$downloadUrl = "https://download.sysinternals.com/files/Procdump.zip"
$outputPath = "$env:TEMP\Procdump.zip"
$extractPath = $args[0]

# Download ProcDump
Invoke-WebRequest -Uri $downloadUrl -OutFile $outputPath

# Create extraction directory
New-Item -ItemType Directory -Path $extractPath -Force

# Extract ZIP
Expand-Archive -Path $outputPath -DestinationPath $extractPath -Force

# Remove ZIP after extraction
Remove-Item -Path $outputPath -Force

# Verify installation
if (Test-Path "$extractPath\procdump.exe") {
    Write-Output "You just got a promotion!"
} else {
    Write-Output "Hey it seems like you didn't get a promotion. Run me again!"
}
