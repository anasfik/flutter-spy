# Flutter Spy

```bash
    ________      __  __               _____            
   / ____/ __  __/ /_/ /____  _____   / ___/____  __  __
  / /_  / / / / / __/ __/ _ \/ ___/   \__ \/ __ \/ / / /
 / __/ / / /_/ / /_/ /_/  __/ /      ___/ / /_/ / /_/ / 
/_/   /_/\__,_/\__/\__/\___/_/      /____/ .___/\__, /  
                                        /_/    /____/

Usage: flutter-spy <file>

Arguments:
  file          The APK file to spy on
```

## Overview

Flutter Spy is a Bash-based command-line tool designed to provide insightful code analysis and data extraction capabilities from built Flutter apps with reverse engineering. It empowers developers, bug hunters, and security enthusiasts to explore and uncover valuable information within Flutter app binaries.

Flutter Spy supports currently gathering info from Android apps only (APK files), thus it is universal for almost all other platforms since this is what Flutter is used for.  

## Features

- [x] Data Extraction: Extracts essential information such as API endpoints, URLs, emails, used packages, phone numbers, secret/public keys, environment variables, and config files.
  - [x] Extract emails.
  - [x] Extract URLs/URIs.
  - [x] Extract potential phone numbers.
  - [x] Extract potential API endpoints/routes.
  - [x] Extract used Flutter packages and their links at [pub.dev](https://pub.dev/).
  - [x] Extract SQL and other database queries...
  - [x] Extract `.env` (Environment Variables) files.
  - [x] Extract Potential JSON/YAML config files.
  - [x] Extract content-specific files. (md, html, css, js...)
  - [x] Extract Potential localization files.
  - [x] Extract all other Flutter assets (PNG, GIF, SVG, TTF, PSD, WEBP...).
  - [ ] Extract used Flutter Engine information as the used Flutter engine.
  - [x] Extract the original project file structure.

- [x] Exportable Reports: Output a detailed report folder with all results.

- [x] Easy to use: Flutter Spy is designed to be easy to use and requires no prior knowledge of Flutter or Dart, you can use it on any built Flutter app.

## Planned Features
Let me know if there is need for this:

- [ ] Extract common API keys such as Firebase, Stripe, OpenAI, AWS...
- [ ] Code Analysis: Performs static analysis on the app's code to identify potential security issues and vulnerabilities.
  - [ ]  Analyse the `AndroidManifest.xml` file and gather permissions, intents, activities, services, compileSdkVersion, minSdkVersion, and targetSdkVersion.
  - [ ]  Analyse MainActivity.java used platform channels, initializations...

- [ ] Automated bug hunting: Identifies common security issues and vulnerabilities such as unsecured API endpoints, exposed sensitive data, and Insecure Firebase Database (this is planned to be done with another language, maybe Python or Dart itself).


## Prerequisites
To run Flutter Spy without issues, make sure these utilities are installed globally in your machine.

- [x] [Jadx CLI](https://github.com/skylot/jadx): Used to decompile the APK file, Flutter Spy will look to get its full path with `which jadx` command. (if you are on Debian-based distros such as Ubuntu/Kali Linux, you can install it via sudo apt install jadx)

## Installation

Note: Before installing Flutter Spy, please know that Flutter Spy is under active development, there are a lot of [features](#features) that are not implemented or incomplete.

Run this command in your terminal to install Flutter Spy:

```bash
git clone https://github.com/anasfik/flutter-spy.git # Clone the repo
cd flutter-spy # Change the directory to the repo
chmod +x INSTALLER.sh # Make the installer executable
./INSTALLER.sh # Run the installer
```

This will install Flutter Spy in your home directory, at `~/.flutter-spy/`, and add the export path command to the correct profile file (`.bashrc` for Bash, `.zshrc` for ZSH, and `.profile` for Fish).

Open a new terminal window and run `flutterspy` to make sure that the installation was successful.

## Usage

```bash
flutter-spy /path/to/apk/file.apk
```

And that's it, the script will do the rest for showing you all findings by exporting a report folder containing all findings is named based on the exact date of export:

```bash
report-$(date +%Y-%m-%d-%H-%M-%S)

# Example: report-2023-12-18-18-17-43
```
it will contain everything.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
