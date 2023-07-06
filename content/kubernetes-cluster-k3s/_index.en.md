+++
archetype = "chapter"
title = "Kubernetes cluster k3s"
weight = 1
description = "Cluster kubernetes con k3s. 1 nodo master (control-plane) + 'N' nodos worker"
+++

> En este proyecto se despliega un cluster Kubernetes basado en k3s.

![Representación del despliegue](kubernetes-cluster-k3s.png?width=60pc&classes=shadow)

___URL repositorio:___ [Gitlab/dzamo/k8s-k3s-various-clusters](https://gitlab.com/dzamo/k8s-k3s-various-clusters/001-cluster-k3s
)

## Tecnologías usadas

- Alma Linux 9
- K3s
- Ansible - roles
- Instalación desatendida del sistema operativo
- KVM. Reserva y creación del recurso vía CLI - virt-install
