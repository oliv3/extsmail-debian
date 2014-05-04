#!/bin/sh
VSN=1.8
PKG=extsmail-$VSN
TAR=$PKG.tar.gz
DESTDIR=build-debian

mkdir -p $DESTDIR
ln -sf ../$TAR $DESTDIR/extsmail_$VSN.orig.tar.gz
cd $DESTDIR && tar xvf ../$TAR && cd $PKG && cp -r ../../debian . && cd ../.. 
cd $DESTDIR/$PKG && pdebuild --auto-debsign -- --twice && cd ../..
