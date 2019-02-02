#!/usr/bin/env bash
VSN=2.2
PKG=extsmail-$VSN
TAR=$PKG.tar.gz
DESTDIR=build-debian

rm -rf $DESTDIR
mkdir $DESTDIR
ln -sf ../$TAR $DESTDIR/extsmail_$VSN.orig.tar.gz
cd $DESTDIR && tar xvf ../$TAR && cd $PKG && cp -r ../../debian . && cd ../.. 
cd $DESTDIR/$PKG && pdebuild --auto-debsign -- --twice && cd ../..
