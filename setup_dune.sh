# setup_dune.sh
#
# Generic product setup file for dune.
#
# Goal is to define the PRODUCTS path and setup the ups command.

PRE="setup_dune: "

echo ${PRE}Setting up DUNE UPS products for $DUNE_SITE
# DUNE product dir Jan 2022
PRODDIR=/cvmfs/dune.opensciencegrid.org/products/dune
if [ ! -r $PRODDIR ]; then
  PRODDIR=`echo ${PRE}$PRODUCTS | sed 's/.*://g'`
fi
PRODSETUP=$PRODDIR/setups
if [ -n "$DUNE_VERBOSE" ]; then echo Setting up ups with $PRODSETUP; fi
source $PRODSETUP
echo ${PRE}Done
