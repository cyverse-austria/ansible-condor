# Htcondor Deployment Playbooks

The playbook (`./condor.yml`) in this directory installs a HTCondor cluster
for the CyVerse Discovery Environment.

## supported linux distributions

* Rocky 9
* Debian 12

## some roles

The roles `common`, `condor_masuex` are installing a HTCondor cluster.  
All roles with prefix `de-` are needed to add the connection to the Cyverse
Discovery Environment (CD). The jobs from CD are mostly prepared and executed
using containers. Therefore all HTCondor cluster members except the master
needs docker and docker-compose installed (roles: `docker`, `docker-compose`).

## vars needed
Change the needed var in `group_vars/all.yml`, especially:
* `condor_domain`: The domain-name the HTCondor-cluster is running in.
* `common__condor_version`: This role-var should be set *globally*. It
  determines the condor-version that will be installed (for all supported
  linux distributions).

### de-condor-launcher

This program accepts job requests from DE and submits it to the HTCondor
cluster. All detail and configurations are in the `/etc/jobservices.yml` file.

### de-road-runner

Submitted to the node. This job creates a `docker-compose.yml` file with three
services.
1. get needed files for the job
2. execute the job
3. push all output back

To do this `de-porklock` is needed.

### de-porklock

This image enables `de-road-runner` to get and push files with iRODS.

### de-docker-logging-plugin

Image to write the logging to `/var/log/de-docker-logging-plugin`.

### de-network-pruner

Removes unused, unneeded and/or finished docker-networks.

### de-docker-janitor

Removes unused, unneeded and/or finished docker-containers.

## important config

This role needs a `/etc/jobservices.yml`. In this file all communication
between CD and HTCondor is configured. Incl. iRODS, amqp, porklock, ...  
A template can be found in `./roles/de-condor-launcher/templates`.  
The file also contains the `keycloak` credential => **be careful**.

## kind of a bug

`road-runner` creates a container that needs two directories to work.
* A `tempdir`: default to `/tmp` (**not** changeable by the user) and
* a `working_dir`: default to `/de-app-work`

When creating a job inside DE, it is possible to define this `Working
Directory`. If the user points this `woring_dir` to `/tmp` too, the job will
not be able to run.  
(The container tries to mount the same volume (`/tmp`) to two different directories
, but the error-message is not really indicating this as the reason.)
