echo Setting up PRODUCTS for FNAL
if true; then
  source /grid/fermiapp/products/setups.sh
  source /grid/fermiapp/products/larsoft/setup
  source /grid/fermiapp/products/dune/setup_dune.sh
else
  source /cvmfs/fermilab.opensciencegrid.org/products/larsoft/setup
fi
echo PRODUCTS=$PRODUCTS
