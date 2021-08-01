cd /data/glusterfs
make clean
./autogen.sh &&  CFLAGS="-g3" ./configure --prefix=/usr --libdir=/usr/lib64 --localstatedir=/var --sysconfdir=/etc --enable-debug && make CFLAGS="-g3"
