$VERSION_FILE = "$((Get-Item -Path ".\").FullName)\..\myapp.csproj"


# Get the current version number from the .csproj file
$version = (Get-Content -Path $VERSION_FILE) | ForEach-Object {
    if ($_ -match '<Version>(\d+)\.(\d+)\.(\d+)\.(\d+)</Version>') {
        $matches[1], $matches[2], $matches[3], $matches[4]
    }
}

# Increment the fourth element of the version number by 1
$version[3] = [int]$version[3] + 1

# Combine the elements of the version array into a string with dots
$newVersion = $version -join '.'

# Replace the old version number with the new version number in the .csproj file
(Get-Content -Path $VERSION_FILE) | ForEach-Object {
    if ($_ -match '<Version>(\d+)\.(\d+)\.(\d+)\.(\d+)</Version>') {
        $_ -replace $_, "<Version>$newVersion</Version>"
    } else {
        $_
    }
} | Set-Content -Path $VERSION_FILE

# Write the new version number to the console
Write-Host "The new version is: $newVersion"