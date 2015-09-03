# config.sh
#
# David Adams
# August 2015
#
# This is an example configuration file for dune-dev.

# Specify the LBNE project to be used.
# Allowed values: larsoft, dunetpc
DUNE_PROJECT=dunetpc

# For larsoft, specify the version.
DUNE_PROJECTVERSION=v04_21_01

# Specify the UPS qualifier.
# UPS can be used to discover the available values, e.g.
# > ups list -aK+ | grep larsoft | grep v02_03_00
DUNE_QUAL=e7:prof

# Flag for which increasing values provide more log messages.
DUNE_VERBOSE=1
