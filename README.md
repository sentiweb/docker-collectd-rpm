## Build Collectd RPM for Rocky Linux 8

This repo can be used to build rpm for collectd 5.12 for Rocky Linux 8 (since the provided by epel use 5.9 buggy version load plugin problem)

# Usage

- Build container
```sh
make docker
```

- Build the RPM
```sh
make run
```

The RPMS and RPM will be in RPMS directory (the run command create && mount this directory as a volume in the container)

