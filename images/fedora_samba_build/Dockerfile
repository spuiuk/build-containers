FROM	fedora:latest
ENV	REFRESHED_AT 2021-08-25-1

RUN	dnf update -y
RUN 	dnf install -y git gdb gcc python36 perl automake autoconf libtool flex bison	\
	rpm-build iputils iproute

RUN	dnf install -y openssl-devel libxml2-devel libaio-devel libibverbs-devel	\
	librdmacm-devel readline-devel glib2-devel libacl-devel sqlite-devel fuse-devel \
	cups-devel dbus-devel docbook-style-xsl libcap-devel libldb-devel		\
	libtalloc-devel libtdb-devel libtevent-devel libxslt openldap-devel pam-devel	\
	perl-ExtUtils-MakeMaker perl-Parse-Yapp perl-Test-Simple popt-devel python3-tdb	\
	python3-tevent gnutls-devel libtirpc libtirpc-devel jansson-devel python3-devel	\
	python3-pip libarchive-devel lvm2-devel userspace-rcu-devel libcmocka-devel	\
	quota-devel libnsl2-devel rpcgen python3-pyasn1-modules.noarch
RUN	dnf install -y glusterfs-api-devel glusterfs-devel
RUN	pip3 install -Iv cryptography==3.3.1
RUN	pip3 install iso8601 asn1

COPY	samba_build.sh /usr/local/bin/samba_build.sh
RUN	chmod 755 /usr/local/bin/samba_build.sh

WORKDIR	/root
RUN	ln -sf /data/samba /root/samba

CMD	["/bin/bash"]
