#!/bin/zsh

startSpy() {
    decompileApp $1
    spyOnLibAppSoFile $1
}

spyOnLibAppSoFile() {
    fromLibAppSoFile=$(find $1-decompiled -name "libapp.so")
    
    
    if [ $? -eq 0 ]; then
        echo "Found libapp.so files:"
        echo $fromLibAppSoFile
        
        firstLibAppSoFile=$(echo $fromLibAppSoFile | head -1)
        echo "Using $firstLibAppSoFile"
        extractInfoFromLibAppSoFile $firstLibAppSoFile
        
    else
        echo "Failed to find libapp.so file."
        exit 1
    fi
    
}

