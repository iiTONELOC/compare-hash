# Author: Anthony Tropeano
# Date: 10/13/2023

# Purpose: Compares two hash values and returns true if they are equal
# Example: compareHash ~/Downloads/ubuntu-22.04.3-live-server-arm64.iso 5702372d25111e24d59596de62ae24daef873018cbf63c9dd9ff12292a57aca9 sha256
# Output: True

filePath=$1
hashValue=$2
hashType=$3

hashTypes=("md5" "sha1" "sha256" "sha512")

# check for help flag flag
if [[ $filePath == "-h" || $filePath == "--help" || $filePah == "-help" ]]; then
    echo "Compares two hash values and returns true if they are equal"
    echo "  Usage: compareHash /path/to/file.txt hashValue hashType"
    echo "  Acceptable hash types: md5, sha1, sha256, sha512"
    echo "  Example: compareHash ~/Downloads/ubuntu-22.04.3-live-server-arm64.iso 5702372d25111e24d59596de62ae24daef873018cbf63c9dd9ff12292a57aca9 sha256"
    exit 0
fi

if [[ -z $filePath ]]; then
    echo "Please provide a file path.\nEx: compareHash.sh /path/to/file.txt hashValue hashType"
    exit 1
fi

if [[ -z $hashValue ]]; then
    echo "Please provide a hash value.\nEx: compareHash.sh /path/to/file.txt hashValue hashType"
    exit 1
fi

if [[ -z $hashType ]]; then
    echo "Please provide a hash type.\nEx: compareHash.sh /path/to/file.txt hashValue hashType"
    exit 1
fi

if [[ ! -f $filePath ]]; then
    echo "File not found. Please provide the absolute file path."
    exit 1
fi

if [[ ! ${hashTypes[(ie)$hashType]} -le ${#hashTypes} ]]; then
    echo "Please provide a valid hash type.\nAcceptable hash types: md5, sha1, sha256, sha512"
    exit 1
fi

fileHash=$(openssl $hashType $filePath | awk '{print $2}')

# compare the hash values
# convert both to lowercase to ensure that the comparison is case insensitive


if [[ ${fileHash:l} == ${hashValue:l} ]]; then
    echo "True"
else
    # echo the hash values to the console
    
    echo "False"
fi
