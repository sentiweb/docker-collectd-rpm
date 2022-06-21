FROM rockylinux:8.5
RUN dnf -y install 'dnf-command(config-manager)'
RUN dnf config-manager --set-enabled powertools
RUN dnf install -y epel-release git wget && dnf -y groupinstall 'Development Tools'

RUN dnf install -y OpenIPMI-devel \
    curl-devel \
    gpsd-devel \
    hiredis-devel \
    iproute-static \
    iptables-devel \
    java-devel \
    jpackage-utils \
    libatasmart-devel \
    libdbi-devel \
    libesmtp-devel \
    libgcrypt-devel \
    libmemcached-devel \
    libmicrohttpd-devel \
    libmnl-devel \
    libnotify-devel \
    liboping-devel \
    libpcap-devel \
    libpq-devel \
    librabbitmq-devel \
    librdkafka-devel \
    libvirt-devel \
    libxml2-devel \
    lm_sensors-devel \
    lua-devel \
    mariadb-connector-c-devel \
    mongo-c-driver-devel \
    net-snmp-devel \
    nut-devel \
    openldap-devel \
    perl-ExtUtils-Embed \
    perl-ExtUtils-MakeMaker \
    perl-devel \
    protobuf-c-devel \
    python3-devel \
    qpid-proton-c-devel \
    riemann-c-client-devel \
    rrdtool-devel \
    systemd-devel \
    varnish-libs-devel \
    yajl-devel 

WORKDIR /root
RUN mkdir rpmbuild rpmbuild/SPECS rpmbuild/SOURCES rpmbuild/RPMS
COPY . .

CMD make build && cp /root/rpmbuild/RPMS/x86_64/* /RPMS && cp /root/rpmbuild/SRPMS /RPMS



