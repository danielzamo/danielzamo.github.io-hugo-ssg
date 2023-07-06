+++
tags = ["virtualization","projects","KVM","UbuntuLTS"]
title = "Anfitrión KVM"
weight = 20
description = "Ubuntu server LTS, host anfitrión virtualización KVM"
+++

> Despliegue de servidor host anfitrión host virtualización KVM.

## Especificación inicial

- 1 x bridge: `br0` 
- 1 x ethernet: `enp1s0`
- Configuración IP:
  
  | Especificación | asignación (fija) |
  |--:               |:-- |
  |_IP_| `192.168.123.35`|
  |_gateway_| `192.168.123.1`|
  |_red_| `192.168.123.0/24`|
  |_DNS1-3_| `192.168.123.1,8.8.8.8,1.1.1.1`|

## Actualización sistema, instalando paquetes (opcionales)

```bash
dzamo@ubuntu-k8s:~$ sudo apt -y update && sudo apt -y upgrade
dzamo@ubuntu-k8s:~$ sudo apt install -y neovim tmux vim vim-scripts exuberant-ctags python-greenlet-dev
```

## Instalación/configuración de KVM

```bash
# Install KVM in Ubuntu
dzamo@ubuntu-k8s:~$ sudo apt -y install qemu-kvm libvirt-dev bridge-utils libvirt-daemon-system libvirt-daemon virtinst bridge-utils libosinfo-bin libguestfs-tools virt-top
dzamo@ubuntu-k8s:~$ sudo usermod -a $USER -G libvirt,libvirt-qemu,libvirt-dnsmasq,kvm
dzamo@ubuntu-k8s:~$ sudo modprobe vhost_net
dzamo@ubuntu-k8s:~$ sudo lsmod | grep vhost
dzamo@ubuntu-k8s:~$ echo "vhost_net" | sudo tee -a /etc/modules
dzamo@ubuntu-k8s:~$ sudo vim /etc/netplan/00-installer-config.yaml
```

### Configuración bridge e interface eth

```bash
dzamo@ubuntu-k8s:~$ cat /etc/netplan/00-installer-config.yaml 
network:
  ethernets:
    enp1s0:
      dhcp4: false
      dhcp6: false
  bridges:
    br0:
      interfaces: [enp1s0]
      dhcp4: false
      addresses: [192.168.123.35/24]
      macaddress: 52:54:00:e8:a8:08
      routes:
        - to: default
          via: 192.168.123.1 
          metric: 100
      nameservers:
        addresses: [192.168.123.1,1.1.1.1,8.8.8.8]
        search: [my.net]   
      parameters:
        stp: false
      dhcp6: false
  version: 2

dzamo@ubuntu-k8s:~$ sudo netplan apply
dzamo@ubuntu-k8s:~$ ip a
dzamo@ubuntu-k8s:~$ wget www.google.com
dzamo@ubuntu-k8s:~$ rm index.html 
dzamo@ubuntu-k8s:~$ ip a
dzamo@ubuntu-k8s:~$ sudo reboot
```

