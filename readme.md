# Flutter Spy

## Overview

Flutter Spy is a Bash-based command-line tool designed to provide insightful analysis and data extraction capabilities for reverse engineered Flutter apps. It empowers developers, bug hunters, and security enthusiasts to explore and uncover valuable information within Flutter app binaries.

## Features

- [x] Data Extraction: Extracts essential information such as APIs endpoints, URLs, emails, used packages, phone numbers, secret/public keys, environment variables, config files.

- [-] Code Analysis: Performs static analysis on the app's code to identify potential security issues and vulnerabilities.

- [-] Automated bugs hunting: Identifies common security issues and vulnerabilities such as unsecured API endpoints, exposed sensitive data, Insecure Firebase Database,

- [-] AI-powered: Uses OpenAI's GPT-3.5/GPT-4 to validate the extracted data and identify potential security issues.

- [-] Exportable Reports: Generates a detailed report in HTML format that can be easily shared with others.

- [-] Easy to use: Flutter Spy is designed to be easy to use and requires no prior knowledge of Flutter or Dart, you can use it on any built Flutter app.

## Preqrequisites

- [x] JadX CLI, used to decompile the apk filen you can get it from [here](https://github.com/skylot/jadx)
- [x] Bash, used to run the script.

## Installation

In order to locate Jadx on your system, you will need to add it to your PATH environment variable. To do so, run the following command:

```bash
export PATH=$PATH:/path/to/jadx/bin
```

Then clone the repository and run the script:

```bash
git clone https://github.com/anasfik/flutter-spy.git # Clone the repository
cd flutter-spy # Change directory to the cloned repository
cd src # Change directory to the source code
export PATH=$PATH:"$(pwd)" >> ~/.bashrc # Add the script to your PATH
source ~/.bashrc # Reload your bashrc file

```

## Usage

```bash
flutter-spy /path/to/apk/file.apk
```

And that's it, the script will do the rest for you.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```

```
