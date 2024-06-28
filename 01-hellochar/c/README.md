#### Makefile

The Makefile is configured to compile using cc65.  To compile run the following:

    $ make

Once compiled run the program in the x16emu emulator using the following:

   $ make run

#### Compiling Manually

If you want to compile the binaries manually, you can do this using either llvm-mos
or cc65.

Compile using llvm-mos

    $ mos-cx16-clang -Os -o HELLOWORLD.PRG helloworld.c

Compile using cc65

    $ cl65 -t cx16 -o HELLOWORLD.PRG -l helloworld.list helloworld.c

#### Running in x16emu Emulator

    $ x16emu -prg HELLOWORLD.PRG

Once the emulator is running, type "RUN".

Or run the program automatically:

    $ x16emu -prg HELLOWORLD.PRG -run