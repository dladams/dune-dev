# dune-setup.sh
#
# David Adams
# July 2014
#
# Bash file to set the environment used by build scripts
# in this package.

SETUPFILE=`pwd`/dunesetup.sh
if test -r $SETUPFILE; then
  echo Local setup file already exists: $SETUPFILE
  echo Please is source it rather than the one in the build support package.

else

  # Capture the location where the DUNE scripts are installed.
  THISFILE=`readlink -f $BASH_SOURCE`
  THISDIR=`dirname $THISFILE`
  if test -z "$DUNE_INSDIR"; then
    export DUNE_INSDIR=$THISDIR
  else
    if [ $THISDIR != $DUNE_INSDIR ]; then
      echo Build support package directory is being changed:
      echo "  Old: $DUNE_INSDIR"
      echo "  New: $THISDIR"
      export DUNE_INSDIR=$THISDIR
    fi
  fi

  # If not already set, use the current directory as the location of
  # the LBNE development area.
  if test -z "$DUNE_DEVDIR"; then
    export DUNE_DEVDIR=`pwd`
  else
    NEWDIR=`pwd`
    if [ $NEWDIR != $DUNE_DEVDIR ]; then
      echo Development directory is being changed:
      echo "  Old: $DUNE_DEVDIR"
      echo "  New: $NEWDIR"
      export DUNE_DEVDIR=$NEWDIR
    fi
  fi

  # Create the local setup file
  echo "# dunesetup.sh
#
# Generated at `date`

export DUNE_INSDIR=$DUNE_INSDIR
export DUNE_DEVDIR=$DUNE_DEVDIR
alias dune=\$DUNE_INSDIR/lbne
alias du=\$DUNE_INSDIR/lbne" >> $SETUPFILE

# If absent, create a configuration file.
FILE=$DUNE_DEVDIR/config.sh
if ! test -r $FILE; then
  echo
  echo Copying default configuration file to
  echo "  $FILE"
  echo Please modify appropriately.
  cp $DUNE_INSDIR/config.sh $FILE
fi

# If absent, create a package list.
FILE=$DUNE_DEVDIR/packages.txt
if ! test -r $FILE; then
  echo
  echo Copying default package list to
  echo "  $FILE"
  echo Please modify appropriately.
  cp $DUNE_INSDIR/packages.txt $FILE
fi

# Source the local setup file.
source $SETUPFILE

fi
