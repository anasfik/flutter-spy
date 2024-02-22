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
  - [ ] Extract used Flutter Engine information as the used Flutter engine version, Dart language version, version hashes...
  - [x] Extract the original project file structure.

- [x] Exportable Reports: Output a detailed report folder with all results.

- [x] Easy to use: Flutter Spy is designed to be easy to use and requires no prior knowledge of Flutter or Dart, you can use it on any built Flutter app.

## Prerequisites
To run Flutter Spy without issues, make sure these utilities are installed globally in your machine.

- [x] [Jadx CLI](https://github.com/skylot/jadx): Used to decompile the APK file, Flutter Spy will look to get its full path with `which jadx` command. (if you are on Debian-based distros such as Ubuntu/Kali Linux, you can install it via `sudo apt install jadx`)

**NOTE:** For Termux Installation You don't need to do the installation manually, the installation script will take care of it, also if you've jadx previously installed it'll skip jadx installation.

## Installation

- **Linux:**
Note: Before installing Flutter Spy, please know that Flutter Spy is under active development, there are a lot of [features](#features) that are not implemented or incomplete.

Run this command in your terminal to install Flutter Spy:

```bash
git clone https://github.com/anasfik/flutter-spy.git # Clone the repo
cd flutter-spy # Change the directory to the repo
chmod +x INSTALLER.sh # Make the installer executable
./INSTALLER.sh # Run the installer
```

- **Android(Termux):**
```shell
pkg install wget && wget https://raw.githubusercontent.com/anasfik/flutter-spy/main/install_termux.sh && chmod +x install_termux.sh && ./install_termux.sh
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

## Want to help this?
as a Developer, and, because I don't know everything, you can help this project by informing me about possible findings in a FLutter app other than existing ones, and this is by:

- if you're a Flutter developer, try this tool on your build app, if you notice that important information like API keys, phrases, assets, and native libraries... are not extracted, then please open an issue with details, it is not necessary to include your app, just expected findings.
- if you're a Bug hunter or Pen tester, and you know any information or vulnerabilities that are previously reported by you or the community, just open an issue and mention it, and I will handle the rest.
- Try the tool on any found Flutter-built apps, then mention any issues or unexpected behaviors you face if any.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
