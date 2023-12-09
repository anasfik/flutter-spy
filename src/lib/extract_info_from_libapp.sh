#!/bin/bash

extractInfoFromLibAppSoFile() {
    libappSoFile=$1
    
    extractEmailsFromLibAppSoFile $libappSoFile
    extractUrlsFromLibAppSoFile $libappSoFile
    extractPhoneNumbersFromLibAppSoFile $libappSoFile
    extractApiEndpointsFromLibAppSoFile $libappSoFile
    extractPackageNamesFromLibAppSoFile $libappSoFile
    extractIpAddressesFromLibAppSoFile $libappSoFile
    extractDomainsFromLibAppSoFile $libappSoFile
    extractHostnamesFromLibAppSoFile $libappSoFile
}