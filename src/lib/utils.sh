#!/bin/bash

doesFileExist() {
    local file=$1
    
    if [ -e $file ]; then
        true
    else
        false
    fi
}


noArgumentsProvided() {
    if [ $# -eq 0 ]; then
        true
    else
        false
    fi
}


jadxExist() {
    local file=$1
    
    which jadx
    
    echo $?
    
    if [ $? -eq 0 ]; then
        true
    else
        false
    fi
}


isProvidedFileApk() {
    local file=$1
    local apkFileRegex=".*\.apk"
    
    if [[ $file =~ $apkFileRegex ]]; then
        true
    else
        false
    fi
}
