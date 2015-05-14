#!/bin/sh
VSN=2.0
PKG=extsmail-$VSN
TAR=$PKG.tar.gz
DESTDIR=build-debian
dist=unstable

rm -rf $DESTDIR
mkdir $DESTDIR
ln -sf ../$TAR $DESTDIR/extsmail_$VSN.orig.tar.gz
cd $DESTDIR && tar xvf ../$TAR && cd $PKG && cp -r ../../debian . && cd ../.. 
cd $DESTDIR/$PKG && pdebuild --auto-debsign -- --buildresult /var/cache/pbuilder/result-$dist --distribution $dist --basetgz /var/cache/pbuilder/base-$dist.tgz --twice && cd ../..
