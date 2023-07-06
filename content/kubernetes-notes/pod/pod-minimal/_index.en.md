+++
tags = ["documentation","kubernetes"]
title = "Definición pod mediante manifiesto"
weight = 20
+++

## Manifiesto mínimo

```bash
[dzamo@victus my-codes]$ cat kubernetes/01-pod-minimal.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx:alpine
```

## Aplicando manifiesto (crear pod)

```bash
[dzamo@victus my-codes]$ kubectl apply -f kubernetes/01-pod-minimal.yaml
```

