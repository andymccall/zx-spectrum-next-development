# ZX Spectrum Next Development Environment Setup

Install VSCode



### Install Mono

Mono is required to run CSpect.

   sudo apt install ca-certificates gnupg
   sudo gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
   echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
   sudo apt update
   sudo apt install mono-devel

### Install CSpect

CSpect is a Mono/.NET application, so the same application should work on any platform.

https://mdf200.itch.io/cspect

When it's download unzip to your tools folder:

   $ unzip CSpect2_19_7_3.zip -d ~/development/tools/cspect

### Download ZXNextOS

   $ unzip sn-emulator-22.10a.zip -d ~/development/tools/sn-emulator

### Add an alias to launch CSpect

   $ vi ~/.profile

At the end of the file add the following:

   alias cspect='MONO_IOMAP=all mono $HOME/development/tools/cspect/CSpect.exe -tv -zxnext -s28 -w4 -img $HOME/development/tools/sn-emulator/sn-emulator-22.10a.img >/dev/null 2>&1'

Test:

  $ cspect

### Install sjasmplus

   $ git clone https://github.com/z00m128/sjasmplus.git
   $ cd sjasmplus
   $ git clone https://github.com/vinniefalco/LuaBridge.git
   $ make clean
   $ make
   $ make install PREFIX=~/development/tools/sjasmplus

Test:

   $ ./sjasmplus --version
   SjASMPlus Z80 Cross-Assembler v1.20.3 (https://github.com/z00m128/sjasmplus)


### Install z88dk

   $ sudo apt install libgmp-dev libxml2-dev

   $ git clone --recurse-submodules --remote-submodules https://github.com/z88dk/z88dk.git
   $ cd z88dk
   $ ./build.sh
   $ make install PREFIX=~/development/tools/z88dk

Add the z88dk to th path:

   $ vi ~/.profile

Add the following at the bottom of the file:

   # set PATH so it includes z88dk if it exists
   if [ -d "$HOME/development/tools/z88dk/bin" ] ; then
       PATH="$HOME/development/tools/z88dk/bin:$PATH"
   fi

   # set ZCCCFG if the directory exists
   if [ -d "$HOME/development/tools/z88dk/share/z88dk/lib/config" ] ; then
       ZCCCFG=${HOME}/develoment/tools/z88dk/share/z88dk/lib/config
   fi

Test:

   $ zcc -v
   A config file must be specified with +file

   zcc - Frontend for the z88dk Cross-C Compiler - v22742-3f05c420f1-20240625
   ...

### HDF Monkey

git clone https://github.com/gasman/hdfmonkey.git