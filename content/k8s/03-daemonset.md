+++
tags = ["documentation","k8s"]
title = "Daemonset"
weight = 3
+++

- En _Kubernetes_ definir/crear un _daemonset_ hace que el componente se ejecute en todos los nodos del cluster. Este tipo componentes puede utilizarse por ejemplo para aplicaciones que monitorizan los nodos.

### Manifiesto de un daemonset básico 

```bash
[dzamo@victus kubernetes]$ cat codes-cli/03-daemonset.yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:alpine
        ports:
        - containerPort: 80
```

### Aplicar el manifiesto

```bash
kubectl apply -f 03-daemonset.yaml
```

### Otros comandos

```bash
[dzamo@victus kubernetes]$ kubectl apply -f codes-cli/03-daemonset.yaml 
[dzamo@victus kubernetes]$ kubectl get daemonset
[dzamo@victus kubernetes]$ k get pods
# El siguiente comando elimina el daemonset (de todos los nodos, y mediante el manifiesto.
[dzamo@victus kubernetes]$ kubectl delete -f codes-cli/03-daemonset.yaml
```

