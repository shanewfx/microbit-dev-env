#!/bin/sh
alias pretty_echo='{ set +x; } 2> /dev/null; f(){ echo "#\n#\n# $1\n#\n#"; set -x; }; f'

# Download sources
cd ~/vagrant_shared
pretty_echo "Upy: Cloning MicroPython repository..."
git clone https://github.com/bbcmicrobit/micropython.git
mkdir python_helpers
cd ~/vagrant_shared/python_helpers
pretty_echo "Upy: Cloning pySerial repository at release v3.4..."
git clone --branch v3.4 https://github.com/pyserial/pyserial.git
pretty_echo "Upy: Cloning uFlash repository..."
git clone https://github.com/ntoll/uflash.git
pretty_echo "Upy: Cloning microREPL repository..."
git clone https://github.com/ntoll/microrepl.git
pretty_echo "Upy: Cloning microFS repository..."
git clone https://github.com/ntoll/microfs.git

# Build it
pretty_echo "Upy: Building MicroPython..."
cd ~/vagrant_shared/micropython
yt clean
yt target bbc-microbit-classic-gcc-nosd
yt up
make all
{ set +x; } 2> /dev/null
pretty_echo "Upy: MicroPython hex file location:\n#    vagrant_shared/micropython/build/firmware.hex"
