# setup_dune.sh
#
# Generic product setup file for dune.
#
# Goal is to define the PRODUCTS path and setup the ups command.

echo Setting up DUNE UPS products for $DUNE_SITE
PRODDIR=`echo $PRODUCTS | sed 's/.*://g'`
PRODSETUP=$PRODDIR/setups
if [ -n "$DUNE_VERBOSE" ]; then echo Setting up ups with $PRODSETUP; fi
source $PRODSETUP
echo Done
