#!/bin/bash
#This is a script for packing GMU build for Pocket CHIP

PACKDIR=$(mktemp -d)
mkdir $PACKDIR/debian
PKGDIR=$PACKDIR/debian

echo Packing in $PACKDIR

#mkdir -p $PKGDIR/usr/bin
#mkdir -p $PKGDIR/usr/share/gmu

#install -D -m755 gmu.bin $PKGDIR/usr/bin/gmu
#install -D -m755 gmu-chip-debian.sh $PKGDIR/usr/bin/gmu.sh 
#install -D -m644 default.keymap $PKGDIR/usr/share/gmu/default.keymap
#install -D -m644 gmu.chip.conf $PKGDIR/usr/share/gmu/gmu.conf
#install -D -m644 gmuinput.chip.conf $PKGDIR/usr/share/gmu/gmuinput.chip.conf
#cp -r themes $PKGDIR/usr/share/gmu/ 

#tar -C $PKGDIR -pczf $PACKDIR/data.tar.gz . 

make install PREFIX=$PKGDIR TARGET=chip

mkdir -p $PKGDIR/DEBIAN

echo "
Package: gmu
Version: 0.9.1-1
Section: multimedia
Priority: optional
Architecture: armhf
Depends: 
Maintainer: NeoTheFox <soniczerops@gmail.com>
Description: Music player for portable handhelds
" >> $PKGDIR/DEBIAN/control

dpkg-deb --build $PKGDIR
