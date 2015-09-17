# dune-dev

David Adams  
August 2015  

Package to help with the checkout, build and running of DUNE SW.

Use "dune help" to see available commands.

## Example session

```
# Installing this package
# Package is installed at PKGDIR = PKGPATH/dune-dev
mkdir PKGPATH
cd PKGPATH
git clone https://github.com/dladams/dune-dev
or
git clone git@github.com:dladams/dune-dev.git
or
git clone ssh://git@github.com/dladams/dune-dev

# Creating and building a development area.
# SW is installed an built in dedicated directory DEVDIR.
# This also initializes the session
mkdir DEVDIR
cd DEVDIR
source PKGDIR/dunesetup.sh
# Edit config.sh and packages.txt

# To initialize in subsequent sessions
source DEVDIR/dunesetup.sh

# To check out packges initially or after modifying the list.
# The list of packages is in packages.txt
# Event if no packages are listed, this must be run once to
# create the working directory.
dune checkout

# To create a new product directory.
lbne newProduct myproduct

# To build after checkout or local changes.
dune build

# To run the tests.
dune test

# To run something in a dedicated session.
lbne run lar -n 10 -c prodsingle_lbne35t.fcl

# To run in the current session.
source $LBNE_DEVDIR/run.sh
lar -n 10 -c prodsingle_lbne35t.fcl

# To run commands in a sub shell.
dune shell
lar -n 10 -c prodsingle_lbne35t.fcl
exit
```
