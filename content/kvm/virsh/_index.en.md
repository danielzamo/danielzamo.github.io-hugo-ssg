+++
tags = ["virtualization","KVM","Articles","libvirtd"]
title = "Comando virsh"
weight = 20
description = "Administración de máquinas virtuales invitadas KVM/libvirt"
+++

> En este artículo es una hoja de referencia parcial de los comandos de virsh.


## Qué virsh?

`virsh` es una interfaz de usuario de administración para dominios invitados (guest, o m'aquinas virtuales) de libvirt. Con `virsh` se puede crear, pausar, reiniciar, cerrar dominios y realizar diferentes tareas de sobre los guest (VM) actuales disponibles en una plataforma de hipervisor de virtualización ***[KVM](https://www.linux-kvm.org/page/Main_Page)***/***[libvirt](https://libvirt.org/)***.

## Listar todos los dominios guest (máquinas virtuales) del host KVM

```bash
virsh list --all
```

## Sintaxis para crear snapshot en de VM en Linux

```bash
virsh snapshot-create-as --domain {VM-NAME} --name "{SNAPSHOT-NAME}"
```

## Referencias

- [Virsh commands cheatsheet to manage KVM guest virtual machines](https://computingforgeeks.com/virsh-commands-cheatsheet/).
- [How to create snapshot in Linux KVM VM/Domain](https://www.cyberciti.biz/faq/how-to-create-create-snapshot-in-linux-kvm-vmdomain/).
- [KVM Cheat Sheet ](https://lzone.de/cheat-sheet/KVM).
