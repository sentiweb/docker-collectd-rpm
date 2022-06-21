.PHONY: docker run run-sh

NAME=collectd-rpm:latest

docker:
	docker build  -t "$(NAME)" . 

run:
	mkdir -p RPMS
	docker run --volume $(PWD)/RPMS:/RPMS --rm $(NAME)

run-sh:
	docker run --rm -it $(NAME) /bin/sh

build:
	wget https://github.com/collectd/collectd/releases/download/collectd-5.12.0/collectd-5.12.0.tar.bz2 -O ~/rpmbuild/SOURCES/collectd-5.12.0.tar.bz2
	cp collectd/* rpmbuild/SOURCES/
	cp collectd/collectd.spec rpmbuild/SPECS
	rpmbuild -ba rpmbuild/SPECS/collectd.spec 
	
#	--define "mainversion ${MAINVERSION}" \
#	--define "version ${VERSION}" \
#	--define "release ${RELEASE}" \
#	--define "_topdir %(pwd)/rpmbuild" \
#	--define "_builddir %{_topdir}/BUILD" \
#	--define "_buildroot %{_topdir}/BUILDROOT" \
#	--define "_rpmdir %{_topdir}/RPMS" \
#	--define "_srcrpmdir %{_topdir}/SRPMS" \
#	--define "_use_lua ${USE_LUA}" \
#	--define "_use_prometheus ${USE_PROMETHEUS}"
