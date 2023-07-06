+++
tags = ["kubernetes","projects","KVM","UbuntuLTS","minikube","container","virtualization"]
title = "Minikube (driver kvm)"
weight = 21
description = "Ubuntu server LTS, cluster k8s minikube (driver kvm)"
+++

> Despliegue de cluster Ubuntu server LTS k8s minikube (driver kvm), en un simple host.

## Tecnologías utilizadas

- minikube
- KVM
- Ubuntu LTS 22.04..

## Especificación inicial

... 

### Dependecias cumplida

En este depliegue se implementa un cluster minikube sobre un simple host. El driver usado es _kvm_. Se da por supuesto que se ha instalado el host anfitrión KVM. Si necesita ayuda puede consultar [esta referencia](https://danielzamo.github.io/ubuntu-lts-server/kvm/index.html).

1 
{{< ref "/ubuntu-lts-server/kvm" >}}

2
[About]({{< ref "/ubuntu-lts-server/kvm" >}} "About Us")

## Actualización sistema, instalando paquetes (opcionales)

```bash
dzamo@ubuntu-k8s:~$ sudo apt -y update && sudo apt -y upgrade
```

## Instalación/configuración de minikube

En este apartado se instala y configura un cluster minikube con driver kvm (REF LINK). 

```bash
dzamo@ubuntu-k8s:~$ # Instalacion minikube
dzamo@ubuntu-k8s:~$ wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
dzamo@ubuntu-k8s:~$ sudo install minikube-linux-amd64 /usr/local/bin/minikube
dzamo@ubuntu-k8s:~$ minikube version
```

## Instalación de kubectl

```bash
dzamo@ubuntu-k8s:~$ sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl \
  -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
dzamo@ubuntu-k8s:~$ sudo chmod 755 ./kubectl
dzamo@ubuntu-k8s:~$ sudo mv kubectl /usr/local/bin/
dzamo@ubuntu-k8s:~$ kubectl version -o json  --client
```

