#!/bin/bash

extractEmailsFromLibAppSoFile() {
    soFiles="$1/libapp"
    
    emails=$(grep -Eioa "[-0-9a-zA-Z.+_]+@[-0-9a-zA-Z.+_]+\.[a-zA-Z]{2,4}" -rh $soFiles | grep -Eiah "^[^_]" | sort -u)
    
    echo ""
    echo "emails:"
    echo $emails
    echo ""
    
}

extractUrlsFromLibAppSoFile() {
    soFiles="$1/libapp"
    
    uriFormattedCommand=$(grep -Eioa "\b\w+:\/\/[-A-Za-z0-9+&@#\/%?=~_|!:,.;]*[-A-Za-z0-9+&@#\/%=~_|]+" -rh $soFiles | sort -u)
    
    #   echo $("$uriFormattedCommand")
    
    httpAndHttpsUrls=$(echo "$uriFormattedCommand" | grep -Eia '^(http|https)' | sort -u)
    echo "HTTP and HTTPs Urls:"
    for url in $httpAndHttpsUrls ; do
        echo $url
    done
    echo ""
    
    ftpUrls=$(echo "$uriFormattedCommand" | grep -Eia '^(ftp)' | sort -u)
    echo "FTP Urls:"
    for url in $ftpUrls ; do
        echo $url
    done
    echo ""
    
    wsAndWssUrls=$(echo "$uriFormattedCommand" | grep -Eia '^(ws|wss)' | sort -u)
    echo "WS and WSS Urls:"
    for url in $wsAndWssUrls ; do
        echo $url
    done
    echo ""
    
    fileprotocolUrls=$(echo "$uriFormattedCommand" | grep -Eia '^(file)' | sort -u)
    echo "File protocol paths"
    for url in $fileprotocolUrls ; do
        echo $url
    done
    echo ""
    
    
    # other urls, exluding http, https, ftp, ws, wss
    otherUrls=$(echo "$uriFormattedCommand" | grep -Eia -v '^(http|https|ftp|ws|wss|file)' | sort -u)
    echo "Other URIs:"
    for url in $otherUrls ; do
        echo $url
    done
    echo ""
}

extractPhoneNumbersFromLibAppSoFile() {
    soFiles="$1/libapp"
    
    phoneNumbers=$(grep -iaoP "\b(?:\+?[0-9()-.\s]*){7,}\b" -rh $soFiles | awk 'length($0) > 9' | sort -u)
    
    all=$(echo "$phoneNumbers")
    
    echo ""
    echo "Potential Phone numbers:"
    for phoneNumber in $all ; do
        echo $phoneNumber
    done
    echo ""
}

extractApiEndpointsFromLibAppSoFile() {
    soFiles="$1/libapp"
    
    apiEndpoints=$(grep -Eioa "\/[a-zA-Z0-9_-]+\/?[a-zA-Z0-9_-]*" -rh $soFiles | awk 'length($0) > 3' | grep -vi ".dart" | sort -u)
    
    all=$(echo "$apiEndpoints")
    
    echo ""
    echo "Potential API endpoints:"
    for apiEndpoint in $all ; do
        echo $apiEndpoint
    done
    echo ""
}

extractPackageNamesFromLibAppSoFile() {
    soFiles="$1/libapp"
    
    packageNames=$(grep -Eoa 'package:.*dart' -rh $soFiles | awk 'length($0) > 3' | grep -oP ':\K[^:/]+/' | awk -F '/' '{print $1}'| sort -u)
    
    all=$(echo "$packageNames")
    
    echo ""
    echo "Potential FLutter packages:"
    for packageName in $all ; do
        echo "https://pub.dev/packages/$packageName"
    done
    echo ""
}



extractInfoFromLibAppSoFile() {
    
    libappSoFile=$1
    reportOutputDir="report-$(date +%Y-%m-%d-%H-%M-%S)"
    
    mkdir "libapp"
    cp $libappSoFile "libapp/libapp.so"
    mkdir $reportOutputDir
    mv "libapp" $reportOutputDir
    
    extractEmailsFromLibAppSoFile $reportOutputDir
    extractUrlsFromLibAppSoFile $reportOutputDir
    extractPhoneNumbersFromLibAppSoFile $reportOutputDir
    extractApiEndpointsFromLibAppSoFile $reportOutputDir
    extractPackageNamesFromLibAppSoFile $reportOutputDir
}


