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
    
    onePresent=0
    
    if [ -f ~/.zshrc ]; then
        echo "$new_path" >> ~/.zshrc
        source ~/.zshrc
        echo "Path added to .zshrc"
        onePresent=1
    fi
    
    if [ -f ~/.bashrc ]; then
        echo "$new_path" >> ~/.bashrc
        source ~/.bashrc
        echo "Path added to .bashrc"
        onePresent=1
    fi
    
    if [ -f ~/.profile ]; then
        echo "$new_path" >> ~/.profile
        source ~/.profile
        echo "Path added to .profile"
        onePresent=1
    fi
    
    if [ $onePresent -eq 0 ]; then
        echo "No .bashrc, .zshrc or .profile found. Please add the following line to your shell config file:"
        echo "$new_path"
        exit 1
    fi
fi

echo "Flutter Spy installed successfully!"
echo "open a new terminal and run 'flutterspy' to get started."

