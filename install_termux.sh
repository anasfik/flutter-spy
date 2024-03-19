if ! command -v termux-setup-storage; then
  echo "This script can be executed only on Termux"
  exit 1
fi

termux-setup-storage

cd $HOME
pkg update
pkg upgrade -y
pkg i -y ncurses-utils

green="$(tput setaf 2)"
nocolor="$(tput sgr0)"
red="$(tput setaf 1)"
blue="$(tput setaf 32)"
yellow="$(tput setaf 3)"
note="$(tput setaf 6)"

echo "${green}━━━ Basic Requirements Setup ━━━${nocolor}"

pkg i -y python git cmake rust golang clang make wget ndk-sysroot zlib libxml2 libxslt pkg-config python-cryptography libjpeg-turbo which
LDFLAGS="-L${PREFIX}/lib/" CFLAGS="-I${PREFIX}/include/" pip install --upgrade wheel pillow
pip install cython setuptools
CFLAGS="-Wno-error=incompatible-function-pointer-types -O0" pip install lxml

echo "${green}━━━ Starting JADX installation ━━━${nocolor}"
if [ -d "$PREFIX/lib/jadx" ]; then
  echo "${red}Seems like JADX is already installed, skipping...${nocolor}"
else
  cd $HOME
  wget https://github.com/skylot/jadx/releases/download/v1.4.7/jadx-1.4.7.zip
  mkdir -p $PREFIX/lib/jadx
  unzip jadx-1.4.7.zip -d $PREFIX/lib/jadx
fi
echo "${yellow}ANDROID SDK TOOLS Successfully Installed!${nocolor}"

echo "${green}━━━ Starting SDK Tools installation ━━━${nocolor}"
if [ -d "android-sdk" ]; then
  echo "${red}Seems like sdk tools already installed, skipping...${nocolor}"
elif [ -d "androidide-tools" ]; then
  rm -rf androidide-tools
  git clone https://github.com/AndroidIDEOfficial/androidide-tools
  cd androidide-tools/scripts
  ./idesetup -c
else
  git clone https://github.com/AndroidIDEOfficial/androidide-tools
  cd androidide-tools/scripts
  ./idesetup -c
fi

echo "${yellow}ANDROID SDK TOOLS Successfully Installed!${nocolor}"

cd $HOME
echo
echo "${green}━━━ Setting up apktool ━━━${nocolor}"
if [ -f "$PREFIX/bin/apktool.jar" ]; then
  echo "${blue}apktool is already installed${nocolor}"
else
  sh -c 'wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.3.jar -O $PREFIX/bin/apktool.jar'
  
  chmod +r $PREFIX/bin/apktool.jar
  
  sh -c 'wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool -O $PREFIX/bin/apktool' && chmod +x $PREFIX/bin/apktool || exit 2
fi
echo "${yellow}apktool Successfully Installed!${nocolor}"

echo
echo "${green}━━━ Starting flutter-spy installation ━━━${nocolor}"
cd $HOME
if [ -d "flutter-spy" ]; then
  rm -rf flutter-spy
  git clone https://github.com/anasfik/flutter-spy
  cd flutter-spy
  chmod +x INSTALLER.sh
  ./INSTALLER.sh || exit 2
else
  git clone https://github.com/anasfik/flutter-spy
  cd flutter-spy
  chmod +x INSTALLER.sh
  ./INSTALLER.sh || exit 2
fi

echo "${yellow}Made with ⌨ by Abhi${nocolor}"

if [ -f "~/.bashrc" ]; then
  cat <<- EOL >> ~/.bashrc
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$HOME/android-sdk/cmdline-tools/latest/bin
export PATH=$PATH:$HOME/android-sdk/platform-tools
export PATH=$PATH:$HOME/android-sdk/build-tools/34.0.4
export PATH=$PATH:$PREFIX/lib/jadx/bin
EOL
elif [ -f "~/.zshrc" ]; then
  cat <<- EOL >> ~/.zshrc
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$HOME/android-sdk/cmdline-tools/latest/bin
export PATH=$PATH:$HOME/android-sdk/platform-tools
export PATH=$PATH:$HOME/android-sdk/build-tools/34.0.4
export PATH=$PATH:$PREFIX/lib/jadx/bin
EOL
else
  cat <<- EOL >> $PREFIX/etc/bash.bashrc
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$HOME/android-sdk/cmdline-tools/latest/bin
export PATH=$PATH:$HOME/android-sdk/platform-tools
export PATH=$PATH:$HOME/android-sdk/build-tools/34.0.4
export PATH=$PATH:$PREFIX/lib/jadx/bin
EOL
fi
