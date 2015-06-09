#! /bin/sh

# The transmem::parsec folder only includes the source code for the core
# PARSEC applications and kernels.  It does not include inputs for testing,
# nor does int include the various dependency libraries used by the core
# PARSEC applications.

# The purpose of this script is to fetch those "other parts" and place them
# in the appropriate locations.

# fetch the parsec core tarball, so that we can extract the pkgs/libs and
# pkkgs/tools folders
echo "Fetching PARSEC core"
wget parsec.cs.princeton.edu/download/3.0/parsec-3.0-core.tar.gz || exit 1

# Do the extractions
echo "Extracting pkgs/tools"
tar xf parsec-3.0-core.tar.gz -C pkgs/ --strip=2 parsec-3.0/pkgs/tools
echo "Extracting pkgs/libs"
tar xf parsec-3.0-core.tar.gz -C pkgs/ --strip=2 parsec-3.0/pkgs/libs

# delete the tarball
rm -f parsec-3.0-core.tar.gz

# fetch the parsec inputs tarball
echo "Fetching PARSEC native inputs"
wget parsec.cs.princeton.edu/download/3.0/parsec-3.0-input-native.tar.gz

# Do the extractions
echo "Extracting input files"
tar xzvf parsec-3.0-input-native.tar.gz --strip=1 parsec-3.0/pkgs/

# delete the tarball
parsec-3.0-input-native.tar.gz