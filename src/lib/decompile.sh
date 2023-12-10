#!/bin/bash

decompileApp() {
    local file=$1
    echo "Decompiling $file..."
    jadxPAth=$(which jadx)
    
    $jadxPath -d $file-decompiled $file
    
    if [ $? -eq 0 ]; then
        echo "Decompiled $file successfully."
    else
        echo "Failed to decompile $file."
    fi
}
