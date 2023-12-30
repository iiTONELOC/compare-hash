# Get the user's profile path
$profilePath = $PROFILE.CurrentUserCurrentHost

# Check if the profile exists
if (-not (Test-Path -Path $profilePath -PathType Leaf)) {
    # Create the profile
    New-Item -Path $profilePath -ItemType File
}

# Check if the function is already in the profile
if (-not (Get-Content $profilePath | Select-String -Pattern "function CompareHash")) {
    # Append the function to the profile
@"
function CompareHash {
    param (
        [string]\$FilePath,
        [string]\$ExpectedHash,
        [string]\$HashType
    )

    \$HashTypes = @("md5", "sha1", "sha256", "sha512")

    # Check for help flag
    if (\$FilePath -eq "-h" -or \$FilePath -eq "--help" -or \$FilePath -eq "-help") {
        Write-Host "Compares two hash values and returns true if they are equal"
        Write-Host "  Usage: CompareHash /path/to/file expectedHash hashType"
        Write-Host "  Acceptable hash types: md5, sha1, sha256, sha512"
        Write-Host "  Example: CompareHash ~\Downloads\msys2-x86_64-20231026.exe 5702372d25111e24d59596de62ae24daef873018cbf63c9dd9ff12292a57aca9 sha256"
        return
    }

    if (-not \$FilePath) {
        Write-Host "Please provide a file path.`nEx: CompareHash /path/to/file expectedHash hashType"
        return
    }

    if (-not \$ExpectedHash) {
        Write-Host "Please provide the expected hash value.`nEx: CompareHash /path/to/file expectedHash hashType"
        return
    }

    if (-not \$HashType) {
        Write-Host "Please provide a hash type.`nEx: CompareHash /path/to/file expectedHash hashType"
        return
    }

    if (-not (Test-Path -Path \$FilePath -PathType Leaf)) {
        Write-Host "File not found. Please provide the absolute file path."
        return
    }

    if (-not \$HashTypes.Contains(\$HashType)) {
        Write-Host "Please provide a valid hash type.`nAcceptable hash types: md5, sha1, sha256, sha512"
        return
    }

    # Compute the hash using Get-FileHash
    \$computedHash = (Get-FileHash -Path \$FilePath -Algorithm \$HashType).Hash

    # Compare the computed hash with the expected hash
    \$result = \$computedHash.ToLower() -eq \$ExpectedHash.ToLower()

    # Output "True" or "False"
    Write-Host \$result
}
"@ | Out-File -Append $profilePath -Force

    Write-Host "Function added to the profile successfully."
} else {
    Write-Host "Function already exists in the profile."
}
