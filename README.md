# CompareHash

## Screenshot

![Screenshot](./assets/screenshot.png)

## Description

It is crucial to verify the integrity of download files. CompareHash provides a means for generating the hash of a file and verifying it in a single command with a straight forward syntax. Hashing is handled by the Operating System with a call to the OpenSSL library.

## Installation

### Clone the Repo

Navigate to a folder of your choosing in the terminal and clone the repository:

```bash
git clone https://github.com/iiTONELOC/compare-hash.git
```

### Configure an Alias

Update the bashrc file to add the alias, I have gone with compareHash but you can name it whatever you would like!

```bash
nano ~./bashrc

#if MAC or using ZSH
nano ~./zshrc

# Then add your alias to the bottom of the file using the following syntax
alias <aliasName>="</path/to/compareHash.sh>"


# Save the file and close it, then type the following in the terminal to make the alias available in the current session
source ~/.bashrc
```

`You can now access compareHash.sh using your <aliasName>!`

## Usage

Integrity can be verified using the following command syntax compareHash `/path/to/file <ListedHashFromWebSite> <algorithm>`.

Here is an example command verifying a download of Ubuntu Jammy:  
`Example: compareHash ~/Downloads/ubuntu-22.04.3-live-server-arm64.iso 5702372d25111e24d59596de62ae24daef873018cbf63c9dd9ff12292a57aca9 sha256`

### Currently Supported Hash Types

`Hash Type: Expected Argument`

- `MD5: md5`
- `SHA-1: sha1`
- `SHA-256: sha256`
- `SHA-512: sha512`

### Help

Help can be accessed by using the -h flag or --help.

## LiCENSE

This project is licensed with an MIT license [which can be viewed here](./LICENSE)
