# CompareHash

## Screenshot

![Screenshot](./assets/screenshot.png)

## Description

It is crucial to verify the integrity of downloaded files. CompareHash provides a means for generating the hash of a file and verifying it in a single command with a straightforward syntax regardless of your OS. On Linux and macOS machines, hashing is handled by the Operating System with a call to the [OpenSSL library](https://www.openssl.org/). On Windows machines, the OS provided [cmdlet Get-FileHash](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-7.4) is used.

## Installation

### Clone the Repo

Navigate to a folder of your choosing in the terminal and clone the repository:

```bash
git clone https://github.com/iiTONELOC/compare-hash.git
```

### Linux/macOS

#### Configure an Alias

Update the bashrc file to add the alias. I have gone with compareHash, but you can name it whatever you would like!

```bash
nano ~/.bashrc

# if macOS or using Zsh
nano ~./zshrc

# Then add your alias to the bottom of the file using the following syntax
alias <aliasName>="</path/to/compareHash.sh>"


# Save the file and close it, then type the following in the terminal to make the alias available in the current session
source ~/.bashrc

# or if using Zsh
source ~/.zshrc
```

`You can now access compareHash.sh using your <aliasName>!`

### Windows

A Powershell script has been provided that creates a function called CompareHash and appends it to the user's Powershell profile. A profile is created if it does not yet exist.

#### Set Execution Policy

Default Powershell settings forbid executing local scripts. To install, the execution policy needs to be changed to `RemoteSigned`. Start Powershell as an Administrator and run the following command:

```bash
Set-ExecutionPolicy RemoteSigned
```

#### Execute the Install Script

Using Powershell, Navigate to the compare-hash folder that was downloaded when cloning the repository and run the following command:

```bash
Powershell.exe -File .\AddCompareHash.ps1

# Reload the profile
. $PROFILE
```

## Usage

### On Linux/macOS

Integrity can be verified using the following command syntax compareHash `/path/to/file <ListedHashFromWebSite> <algorithm>`.

Here is an example command verifying a download of Ubuntu Jammy:

```bash
compareHash ~/Downloads/ubuntu-22.04.3-live-server-arm64.iso 5702372d25111e24d59596de62ae24daef873018cbf63c9dd9ff12292a57aca9 sha256
True # Expected Output
```

### On Windows

The usage is the same as Linux/macOS, except the name is CompareHash rather than compareHash therefore, the syntax is CompareHash `\path\to\file <ListedHashFromWebSite> <algorithm>`

Here is an example of verifying a SHA-256 hash for downloaded MSYS2 tools for Windows:

```bash
CompareHash ~\Downloads\msys2-x86_64-20231026.exe 642c03a64c228927e2fdcc4353d3970ee4cf668d7150138540420051b6b4a60c sha256
True # Expected Output
```

### Currently Supported Hash Types

`Hash Type: Expected Argument`

- `MD5: md5`
- `SHA-1: sha1`
- `SHA-256: sha256`
- `SHA-512: sha512`

### Help

Help can be accessed by using the -h flag or using --help.

## LICENSE

This project is licensed with an MIT license [which can be viewed here](./LICENSE)
