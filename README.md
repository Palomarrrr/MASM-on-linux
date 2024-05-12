# MASM on Linux
A small script I made to set up an environment to build simple MASM projects on Linux.

This should also work on MacOS as there is a Wine build for it, but I don't have a machine to test it on.

## Reqirments
- Wine 32 bit
- A C compiler
- Wget
- Git

## Setup
Run the set up script first.

    $ ./setup.sh

You can then go in and build the template project using the Makefile.

    $ make

This should assemble and link the project and then run it immediately after. To build the project, but not run it, use `make build` instead. The executable file should be in the `build/` directory.

###### Note: 
You may have to change the C compiler used because for some reason I couldn't get `${CC}` to work
