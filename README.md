# K8s cluster on your local machine

Required installations:

* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](https://www.vagrantup.com)

## TL;DR

```console
./run.sh
```

## Detailed explanation

This repo uses Vagrant and VirtualBox to create several VMs which will be your K8s cluster.
K8s is being installed by kubeadm and uses a pre-generated token that is being share with all the nodes.

The file "servers.yml" file contains all the servers that will be provisioned. More masters/nodes can be added as long as your computer is handling the resources allocated by there VMs :-)

For a simple example, the master folder that is being shared with the VM contains "backend" httpd deployment and service