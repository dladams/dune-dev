# duneinit.sh
#
# David Adams
# August 2015
#
# Bash file to be sourced to check out or build DUNE SW.

# Check that the build script installation directory is specified.
if test -z "$DUNE_INSDIR"; then
  echo DUNE_INSDIR is not defined.
else

# Check that the build directory is specified.
if test -z "$DUNE_DEVDIR"; then
  echo DUNE_DEVDIR is not defined.
else

alias dune=$DUNE_INSDIR/dune
alias du=$DUNE_INSDIR/dune

# Set configuration defaults.
export DUNE_PROJECT=larsoft
export DUNE_PROJECTVERSION=v08_42_00
export DUNE_QUAL=e19:prof
export DUNE_VERBOSE=False
export DUNE_CONFIG_FILE=$DUNE_DEVDIR/config.sh
export DUNE_PACKAGE_FILE=$DUNE_DEVDIR/packages.txt
export DUNE_HISTORY=$DUNE_DEVDIR/history.log
export DUNE_LINE="=========================================================="

# Read local configuration.
source $DUNE_CONFIG_FILE

# Set up UPS, git and mrb.
# For now, we use the host name to choose the setup file for fnal
# and BNL or otherwise assume generic installation at $PRODUCTS.
if test -n "${DUNE_VERBOSE}"; then echo Setting up UPS; fi
export DUNE_UPS_SETUP=
if hostname | grep dune.*fnal.gov >/dev/null; then
  PRODUCTS=
  DUNE_SITE=FNAL
  DUNE_UPS_SETUP=$DUNE_INSDIR/fnal_setup_dune.sh
#else if hostname | grep lbne.....rcf.bnl.gov >/dev/null; then
#  PRODUCTS=
#  LDUNESITE=BNL
#  DUNE_UPS_SETUP=$DUNE_INSDIR/bnl_setup_lbne.sh
else if [ -n "$PRODUCTS" ]; then
  DUNE_SITE=`hostname`
  DUNE_UPS_SETUP=$DUNE_INSDIR/setup_dune.sh
else
echo PRODUCTS=$PRODUCTS

  echo WARNING: Unknown site for host `hostname`
fi; fi
if [ -n "$DUNE_UPS_SETUP" -a -r "$DUNE_UPS_SETUP" ]; then
  echo source $DUNE_UPS_SETUP >$DUNE_HISTORY
  source $DUNE_UPS_SETUP
  if [ $(uname) = Darwin ]; then
    setup getopt v1_1_6
  else
    setup git
  fi
  setup gitflow
  if [ $DUNE_PROJECTVERSION = v09_30_00 ]; then
    setup mrb -o
  else
    setup mrb
  fi

  # Setup derived environment.
  THISBASE=`basename $DUNE_DEVDIR`
  THISUSER=`whoami`
  export DUNE_PRODUCT=`echo ${DUNE_PROJECT}_${DUNE_PROJECTVERSION}_${DUNE_QUAL} | sed 's/:/_/g'`
  export DUNE_GIT_BRANCH_NAME=`echo branch-${THISUSER}-${THISBASE} | sed 's/:/_/g'`
  export MRB_PROJECT=$DUNE_PROJECT
  export DUNE_IS_SETUP=True
else
  echo WARNING: Site-specific setup file not found: $DUNE_UPS_SETUP}!
fi

# Terminate error check.
fi; fi
