#!/bin/sh

# This script makes a SRPM - a source RPM file which can be built into the
# appropriate distro specific RPM for any platform.
#
# To build the binary package:
# rpm -i n2n-<ver>.src.rpm
# rpmbuild -bb n2n.spec
#
# Look for the "Wrote:" line to see where the final RPM is.
#
# To run this script cd to the n2n directory and run it as follows
# scripts/mk_SRPMS.sh
#

set -e

exit_fail() {
    echo "$1"
    exit 1
}

PACKAGE="kitten-n2n"
PKG_VERSION="1.4"
PKG_AND_VERSION="${PACKAGE}-${PKG_VERSION}"

TEMPDIR="tmp"

SOURCE_MANIFEST="
README
edge.c
lzoconf.h
lzodefs.h
Makefile
minilzo.c
minilzo.h
n2n.c
n2n.h
n2n.spec
supernode.c
tuntap_linux.c
tuntap_freebsd.c
tuntap_netbsd.c
tuntap_osx.c
twofish.c
twofish.h
edge.8
supernode.1
"

BASE=`pwd`

for F in ${SOURCE_MANIFEST}; do
    test -e $F || exit_fail "Cannot find $F. Maybe you're in the wrong directory. Please execute from n2n directory."; >&2
done

echo "Found critical files. Proceeding." >&2

if [ -d ${TEMPDIR} ]; then
    echo "Removing ${TEMPDIR} directory"
    rm -rf ${TEMPDIR} >&2
fi

mkdir ${TEMPDIR} >&2

cd ${TEMPDIR}

echo "Creating staging directory ${PWD}/${PKG_AND_VERSION}" >&2

if [ -d ${PKG_AND_VERSION} ] ; then
    echo "Removing ${PKG_AND_VERSION} directory"
    rm -rf ${PKG_AND_VERSION} >&2
fi

mkdir ${PKG_AND_VERSION}

cd ${BASE} >&2

echo "Copying in files" >&2
for F in ${SOURCE_MANIFEST}; do
    cp $F ${TEMPDIR}/${PKG_AND_VERSION}/
done

cd ${TEMPDIR} >&2

TARFILE="${PKG_AND_VERSION}.tar.gz"
echo "Creating ${TARFILE}" >&2
tar czf ${BASE}/${TARFILE} ${PKG_AND_VERSION}

cd ${BASE} >&2

rm -rf ${TEMPDIR} >&2

echo ${BASE}/${TARFILE}
