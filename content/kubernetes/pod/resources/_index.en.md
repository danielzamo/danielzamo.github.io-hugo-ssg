+++
tags = ["documentation","kubernetes"]
title = "Sección resources"
weight = 40
+++

## Relevantes en esta nota

- Por medio de los `resources` es que se pueden asignan diferentes recursos a nuestros objetos.
- Dichos recursos pueden ser asignados a diferentes contenedores (no solo a los pod).
- Tipos de resources?
	- Existen al menos 2 tipos de resources que se pueden asignar. Los tipos ___requests___ y los ___limits___.
- La documentación mas completa se encuentra publicada en [Resource Management for Pods and Containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/).

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
      value: "val_var_1"
    - name: dd_agent_host
      valueFrom:
        fieldRef:
          fieldPath: status.hostIP
    resources:
      requests:
        memory: "64Mi"
        cpu: "200m"
      limits:
        memory: "128Mi"
        cpu: "500m"
    ports:
    - containerPort: 80
```

## Tipos de resources

#### Resuorces requests

Son los recursos que garantizamos que ___siempre___ va a tener disponible el objeto. En el ejemplo:

```bash
...
    resources:
      requests:
        memory: "64Mi"
        cpu: "200m"
...
```

_Donde:_

- `memory: "64Mi"`: es la cantidad de memoria garantizada que tendrá disponible el objeto (pod o contenedor), en el ejemplo `"64Mi"` son 64 Megas bytes (la M esta en mayuscula).
- `cpu: "200m"`: es la cantidad de _mili cores_ que debe estar garantizado. A su vez `1000 mili core` es equivalente a `1 core de CPU`. De modo que si en el nodo/host se tiene un total de `10 core CPU` la asignación ___requests___ de `cpu: "200m"` es que _2 core_ serán garantizados de disponible para el objeto.

## Sesión comandos

```bash
...
```

