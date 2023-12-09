#!/bin/zsh

jadxPath="/home/gwhyyy/jadx-1.4.7/bin/jadx"

source src/lib/utils.sh
source src/lib/spy.sh
source src/lib/decompile.sh
source src/lib/extract_info_from_libapp.sh

providedFileName=$1


if noArgumentsProvided $@; then
    echo "No arguments provided. Please provide a file name."
    exit 1
else
    echo "File name provided: $providedFileName"
fi


if doesFileExist $providedFileName; then
    echo "File $providedFileName exists."
else
    echo "File $providedFileName does not exist."
    exit 1
fi


if jadxExist $providedFileName; then
    echo "Jadx is installed."
else
    echo "Jadx is not found, Please install it."
    exit 1
fi



if isProvidedFileApk $providedFileName; then
    echo "File $providedFileName is an apk file."
else
    echo "File $providedFileName is not an apk file."
    exit 1
fi

startSpy $providedFileName