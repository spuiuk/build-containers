#!/bin/sh

set -x
umask 022

SAMBA_PATH="/data/samba"

LANG=C
export LANG
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/lib64/pkgconfig:/usr/share/pkgconfig"
export LDFLAGS="-Wl,-z,relro,-z,now"
export CFLAGS="-g -O0"

cd $SAMBA_PATH

make distclean
./configure --build=x86_64-redhat-linux-gnu --host=x86_64-redhat-linux-gnu \
	--program-prefix= \
	--disable-dependency-tracking \
	--prefix=/usr \
	--exec-prefix=/usr \
	--bindir=/usr/bin \
	--sbindir=/usr/sbin \
	--sysconfdir=/etc \
	--datadir=/usr/share \
	--includedir=/usr/include \
	--libdir=/usr/lib64 \
	--libexecdir=/usr/libexec \
	--localstatedir=/var \
	--sharedstatedir=/var/lib \
	--mandir=/usr/share/man \
	--infodir=/usr/share/info \
        --enable-fhs \
        --with-modulesdir=/usr/lib64/samba \
        --with-pammodulesdir=/usr/lib64/security \
        --with-lockdir=/var/lib/samba/lock \
        --with-statedir=/var/lib/samba \
        --with-cachedir=/var/lib/samba \
        --disable-rpath-install \
        --with-shared-modules=idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2,pdb_tdbsam,pdb_ldap,pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4,auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4 \
        --with-pam \
        --with-pie \
        --with-relro \
        --without-fam \
        --with-system-mitkrb5 \
        --without-ad-dc \
        --with-cluster-support \
        --with-profiling-data \
        --with-piddir=/run \
        --with-sockets-dir=/run/samba \
        --with-systemd \
        --enable-selftest \
        --bundled-libraries=!lmdb \
        --enable-developer
        #--picky-developer --enable-developer
        #--bundled-libraries=heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb,!pyldb-util \
        #--bundled-libraries=heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!lmdb \
if [ $? != 0 ]
then
        exit
fi

make -j4

