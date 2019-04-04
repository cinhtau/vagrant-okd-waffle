# vagrant-okd-waffle
Demo running OKD or OpenShift Container Platform on Vagrant with VirtualBox


## Vagrant

Vagrant is a tool for building and managing virtual machine environments in a single workflow. As virtual machine provider
we choose VirtualBox.

Check version
```bash
vagrant -v
Vagrant 2.2.4
```

### Plugins

Install some plugins.

The hostmanager is important for DNS entries.

```bash
vagrant plugin install vagrant-hostmanager
```

### DNS

Install landrush for DNS between virtual machines.

```bash
vagrant plugin install landrush
```

```bash
vagrant landrush status
```

```bash
vagrant landrush start
```

List all DNS entries
```bash
vagrant landrush ls
```

Set rule
```bash
vagrant landrush set <fqdn> <ip-address>
```

### Create VMs

```bash
cd vagrant
vagrant up
```

## Administration

Ramp up OKD cluster nodes. Vagrant will ask for your sudo password, because `landrush` plugin is altering the `/etc/hosts` file.

```bash
vagrant up
```

Check status
```bash
 ~/development/projects/vagrant-okd-waffle/vagrant   master ●✚  vagrant global-status
id       name   provider   state   directory                                                          
------------------------------------------------------------------------------------------------------
eea5e92  node01 virtualbox running /Users/vinhn.guyen/development/projects/vagrant-okd-waffle/vagrant 
3e9e167  node02 virtualbox running /Users/vinhn.guyen/development/projects/vagrant-okd-waffle/vagrant 
95b11c3  master virtualbox running /Users/vinhn.guyen/development/projects/vagrant-okd-waffle/vagrant 
```

Destroy or remove virtual machines
```bash
vagrant destroy
```