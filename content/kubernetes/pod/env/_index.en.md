+++
tags = ["documentation","kubernetes"]
title = "Sección env"
weight = 30
+++

## Relevantes en esta nota

- Sección variables de entorno, definición `env` en manifiesto.
- Utilización de variables recuperadas desde [kubernetes Downward API](https://kubernetes.io/docs/concepts/workloads/pods/downward-api/)

## Manifiesto

```bash
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:alpine
    env:
    - name: var_1
      value: "value_val_1"
    - name: var_2
      value: "value_val_2"
    - name: DD_AGENT_HOST
      valueFrom:
        fieldRef:
          fieldPath: status.hostIP
```

### env

En la sección `env` se pueden definir/pasar variables de entornos. En lo anterior es:

```bash
    env:                          # Variables de entorno
    - name: var_1                 ## 'Nombre 1'
      value: "value_val_1"        ## Valor variable 'Nombre 1'
    - name: var_2                 ## 'Nombre 2'
      value: "value_val_2"        ## Valor variable 'Nombre 2'
    - name: dd_agent_host         ## Variable definida desde el "Downward API" (son variables/valores que se pueden consultar)
      valueFrom:
        fieldRef:
          fieldPath: status.hostIP ## Se asigna el valor de hostIP (su valor se recupera desde la "Downward API" de kubernetes) donde esta corriendo el pod, en este caso.
```

## Sesión comandos

```bash
[dzamo@victus kubernetes]$ kubectl apply -f 03-pod-w-env.yaml
[dzamo@victus kubernetes]$ kubectl get pod
NAME          READY   STATUS    RESTARTS   AGE
nginx-w-env   1/1     Running   0          18s
[dzamo@victus kubernetes]$ kubectl exec nginx-w-env -- env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=nginx-w-env
NGINX_VERSION=1.25.1
PKG_RELEASE=1
NJS_VERSION=0.7.12
dd_agent_host=10.0.0.84
var_1=value_var_1
var_2=value_var_2
KUBERNETES_PORT=tcp://10.43.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.43.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP_ADDR=10.43.0.1
KUBERNETES_SERVICE_HOST=10.43.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
HOME=/root
[dzamo@victus kubernetes]$ kubectl exec -it nginx-w-env -- sh
/ # hostname
nginx-w-env
/ # exit
```

