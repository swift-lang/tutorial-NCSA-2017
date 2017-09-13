#!/bin/bash
set -eu

# BUILD.SH
# Build the blas leaf package
# Needs CBLAS- simply use the APT packages: libblas-dev liblapack-dev 

LEAF_PKG=blas
LEAF_SO="libtcl${LEAF_PKG}.so"
LEAF_TCL="${LEAF_PKG}.tcl"

TCL_HOME=/usr
TCL_CONFIG=/usr/lib/tcl8.6/tclConfig.sh
TCLSH=${TCL_HOME}/bin/tclsh8.6

# This loads many Tcl configuration variables
. ${TCL_CONFIG}

CFLAGS="-fPIC -std=gnu99 -g"

# Compile the Tcl extension
gcc ${CFLAGS} ${TCL_INCLUDE_SPEC} -c ${LEAF_PKG}_wrap.c

# Build the Tcl extension as a shared library
gcc -shared -o ${LEAF_SO} ${LEAF_PKG}_wrap.o -lblas 
echo "created library: ${LEAF_SO}"

# Make the Tcl package index
export LEAF_PKG LEAF_SO LEAF_TCL
${TCLSH} make-package.tcl > pkgIndex.tcl
echo "created package."

# Tell the user what they need to do to run this
echo "Set in environment: "
echo "SWIFT_PATH=${PWD}"

exit 0
