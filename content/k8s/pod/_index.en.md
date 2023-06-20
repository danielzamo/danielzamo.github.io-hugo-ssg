+++
tags = ["k8s"]
title = "Pod"
weight = 2
+++

## ¿Qué es un pod?

- Un pod es un set de contenedor/es.
- Un pod es el componente mas pequeño/atómico de Kubernetes.
- Un pod puede tener múltiples/varios contenedores, aunque normalmente solo contendrá 1.

## Creación de un pod desde el CLI

El siguiente comando crea un pod. Para esto por ejemplo se puede ejecutar:

```bash
kubectl create deployment deployment-pod-nginx-01 --image=nginx 
```

## Manifiesto para crear 1 pod

Normalmente se utilizan manifiestos, para crear los componentes para desplegar las aplicaciones en un cluster [kubernetes](https://kubernetes.io). Estos están codificados en ficheros `yaml`. A continuación se especifica la creación de un pod (mínimo) mediante un fichero de este tipo. El código es el siguiente:

```bash
cat 01-pod-minimal.md
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:alpine
```

### Aplicando el manifiesto

```bash
kubectl create -f 01-pod-minimal.md
```
