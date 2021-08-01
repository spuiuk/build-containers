FROM	centos:8
ENV	REFRESHED_AT 2021-08-01-1

RUN	dnf update -y
RUN 	dnf install -y git gdb gcc python36 perl automake autoconf libtool flex bison rpm-build

# https://docs.gluster.org/en/latest/Developer-guide/Building-GlusterFS/
RUN	dnf config-manager --set-enabled powertools
RUN	dnf install -y autoconf automake bison dos2unix flex fuse-devel glib2-devel	\
	libacl-devel libaio-devel libattr-devel libcurl-devel libibverbs-devel 		\
	librdmacm-devel libtirpc-devel libuuid-devel libtool libxml2-devel		\
	lvm2-devel make openssl-devel pkgconfig xz-devel  python36-devel		\
	readline-devel rpm-build sqlite-devel systemtap-sdt-devel tar			\
	userspace-rcu-devel rpcgen liburing-devel

#Needed for building gluster rpms
RUN	dnf install -y firewalld selinux-policy-devel

COPY	glusterfs_build.sh /usr/local/bin/glusterfs_build.sh
RUN	chmod 755 /usr/local/bin/glusterfs_build.sh
COPY	glusterfs_rpmbuild.sh /usr/local/bin/glusterfs_rpmbuild.sh
RUN	chmod 755 /usr/local/bin/glusterfs_rpmbuild.sh

WORKDIR	/root

CMD	["/bin/bash"]
