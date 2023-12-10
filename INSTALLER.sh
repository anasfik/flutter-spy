#!/bin/bash

# TODO: check for required deps.


cp -r src .flutter-spy
chmod +x ./.flutter-spy/flutterspy
mv .flutter-spy ~/

new_path="export PATH=\$PATH:~/.flutter-spy"

if grep -Fxq "$new_path" ~/.bashrc
then
    echo "Path already exists in .bashrc"
    exit 1
else
    echo "$new_path" >> ~/.bashrc
    source ~/.bashrc
    echo "Path added to .bashrc"
fi


echo "Flutter Spy installed successfully!"



