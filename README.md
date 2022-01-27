# dune-dev

David Adams  
September 2015  

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
source PKGDIR/setup.sh
# Edit config.sh and packages.txt. Typically DUNE_PROJECTVERSION
# in the former will have to be changed to match the version of
# DUNE_PROJECT in the packages being built. In the latter, list
# those packages that are to be built. If not, already present in
# workdir/srcs, those packages will be checked out with
# "mrb gitCheckout" whcih will presumably take them from the
# appropriate location in gitHub or Redmine.

# To initialize in subsequent sessions
source DEVDIR/dunesetup.sh

# To check out packges initially or after modifying the list.
# The list of packages is in packages.txt
# Event if no packages are listed, this must be run once to
# create the working directory.
dune checkout

# To build after checkout or local changes.
dune build

# To run the tests.
dune test

# To clean (restart build and install), use one of the following.
# The first runs "mrb z" and the second is fast and effective.
dune clean
dune fastclean

# To run something in a dedicated session.
dune run lar -n 10 -c prodsingle_lbne35t.fcl

# To run in the current session.
source $DUNE_DEVDIR/run.sh
lar -n 10 -c prodsingle_lbne35t.fcl

# To run commands in a sub shell (recommended).
dune shell
dune> duneHelp
dune> fcldump myFclFile.fcl 5
dune> lar -n 10 -c prodsingle_lbne35t.fcl
dune> exit

# To use build from a clean area.
source &lt;install-area>/run.sh
lar ...
```
