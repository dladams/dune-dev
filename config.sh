# config.sh
#
# David Adams
# January 2022
#
# This is an example configuration file for dune-dev.
#
# One must first install a base project.
# See https://dune.bnl.gov/wiki/DUNE_LAr_Software_Releases.

# Specify the base project to be used.
# Allowed values: larsoft, dunetpc
DUNE_PROJECT=dunesw

# Specify the version for the base project.
DUNE_PROJECTVERSION=v09_42_00

# Specify the UPS qualifier for the base product.
# UPS can be used to discover the available values, e.g.
# > ups list -aK+ larsoft | grep v02_03_00
DUNE_QUAL=e20:prof

# Flag for which increasing values provide more log messages.
DUNE_VERBOSE=1

# Number of processes to use for building (mrb j flag).
DUNE_MAXPROC=4
