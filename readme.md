# Flutter Spy

## Overview

Flutter Spy is a Bash-based command-line tool designed to provide insightful code analysis and data extraction capabilities from built Flutter apps with reverse engineering. It empowers developers, bug hunters, and security enthusiasts to explore and uncover valuable information within Flutter app binaries.

Flutter Spy support currently gathering info from Android apps only (APK files), thus it is universal for almost other platforms since this is what Flutter is used for.  

## Features

- [ ] Data Extraction: Extracts essential information such as API endpoints, URLs, emails, used packages, phone numbers, secret/public keys, environment variables, and config files.
  - [x] Extract emails.
  - [x] Extract URLs/URIs.
  - [x] Extract potential phone numbers.
  - [x] Extract potential API endpoints/routes.
  - [x] Extract used Flutter packages and their links at [pub.dev](https://pub.dev/).
  - [ ] Extract common API keys such as Firebase, Stripe, OpenAI, AWS...
  - [ ] Extract SQL and other database queries...
  - [ ] Extract .env (Environment Variables) files.
  - [ ] Extract Potential JSON/YAML config files.
  - [ ] Extract Potential localization files.
  - [ ] Extract all other Flutter assets (PNG, GIF, SVG, TTF, PSD, WEBP...).
  - [ ] Extract used Flutter Engine information as the used Flutter engine.

- [ ] Code Analysis: Performs static analysis on the app's code to identify potential security issues and vulnerabilities.
  - [ ]  Analyse the AndroidManifest.xml file and gather permissions, intents, activities, services, compileSdkVersion, minSdkVersion, targetSdkVersion.
  - [ ]  Analyse MainActivity.java used platform channels, initializations...

- [ ] Automated bug hunting: Identifies common security issues and vulnerabilities such as unsecured API endpoints, exposed sensitive data, and Insecure Firebase Database (this is planned to be done with another language, maybe Python or Dart itself).

- [ ] Exportable Reports: Output a detailed report folder with all results.

- [ ] Easy to use: Flutter Spy is designed to be easy to use and requires no prior knowledge of Flutter or Dart, you can use it on any built Flutter app.

## Prerequisites

- [x] grep
- [x] Jadx CLI, used to decompile the APK file you can get it from [here](https://github.com/skylot/jadx)
- [x] Bash, used to run the script.

## Installation

Note: Before installing Flutter Spy, please know that Flutter Spy is under active development, there a lot of [features](#features) that are not implemented or incomplete.

Run this command in your terminal to install Flutter Spy:

```bash
git clone https://github.com/anasfik/flutter-spy.git # Clone the repo
cd flutter-spy # Change directory to the repo
chmod +x INSTALLER.sh # Make the installer executable
./INSTALLER.sh # Run the installer
```

This will install Flutter Spy in your home directory, at `~/.flutter-spy/`, and adds the export path command to the correct profile file (`.bashrc` for Bash, `.zshrc` for ZSH, and `.profile` for Fish).

Open a new terminal window and run `flutterspy` to make sure that the installation was successful.

## Usage

```bash
flutter-spy /path/to/apk/file.apk
```

And that's it, the script will do the rest for you.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
