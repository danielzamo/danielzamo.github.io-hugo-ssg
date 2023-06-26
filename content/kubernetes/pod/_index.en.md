+++
tags = ["kubernetes","documentation"]
title = "Pod"
weight = 2
+++

## ¿Qué es un pod?

- Un pod es un set de contenedor/es.
- Un pod es el componente mas pequeño/atómico de Kubernetes.
- Un pod puede tener múltiples/varios contenedores, aunque normalmente solo contendrá 1.

## Creación de un pod desde el CLI

El siguiente comando crea un _pod_, como un _deployment_. Para esto por ejemplo se puede ejecutar:

```bash
kubectl create deployment deployment-pod-nginx-01 --image=nginx 
```

### Algunos comandos

#### Matando el pod

Para matar el anterior pod se puede ejecutar:

```
[dzamo@victus my-readings] alias k='kubectl'
# pods en ejecución
[dzamo@victus my-readings] k get pods
# eliminar el pod del deployment
[dzamo@victus my-readings] k delete pod deployment-pod-nginx-01-77c5f959c5-z4hfn
```

#### Borrar el deployment (borrar el pod)

```bash
[dzamo@victus my-readings] alias k='kubectl'
# pods en ejecución
[dzamo@victus my-readings] k get deployments
# eliminar el pod del deployment
[dzamo@victus my-readings] k delete deployment deployment-pod-nginx-01
[dzamo@victus my-readings] k get deployments
```


Al haber sido credo con el comando `kubectl create deployment .... `, el orquetador _Kubernetes_ vuelve a levantar el _pod_.

## Creación de pod desde un manifiesto (mínimo)

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

Para aplicar (crear el pod) se puede ejecutar: 

```bash
kubectl create -f 01-pod-minimal.md
```

_Nota:_ Observar en el manifiesto se ha utilizado `kind: Pod` una vez corriendo el propio _pod_ si se lo borra (`kubectl delete ....`) el pod se destruye/borra y Kubernetes no lo volvera a levantar (los de tipo `kind: Pod` simplemente se destruyen).
