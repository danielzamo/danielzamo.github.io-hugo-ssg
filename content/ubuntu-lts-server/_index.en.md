+++
archetype = "chapter"
title = "Ubuntu server LTS"
weight = 4
description = "Ubuntu server LTS"
+++

> En esta sección se comparten configuraciones de servicios y/o configuración de servidores basados en Ubuntu server LTS.

## Especificación hardware

_Especificación hardware:_

- cpu: `4 - ALU`
- RAM: `10Gb`
- HHDD: `20Gb`
- 1 x eth: `enp1s0`

En la figura se representa el servidor con distribución [Ubuntu LTS server 20.04...](https://ubuntu.com) inicial desplegado en este apartado. Esta configuración inicial es utilizada como base para desplegar los servicios cuyo contenido es compartido aquí.

![Ubuntu LTS server](ubuntu-k8s.png)

El nombre hostname: `ubuntu-k8s`


~~___URL repositorio:___ [PENDIENTE](https://gitlab.com/dzamo/). _Por el momento hasta que finalize el proyecto, el contanido solo es compartido aquí, en este sitio web estático_.~~ 

## Tecnologías usadas

- Distribución Linux principal usada: [Ubuntu server LTS - 22.04..](https://ubuntu.com).

## Despliegues/artículos actuales compartidos aquí

Por el momento, en esta sección se publican los siguientes casos de uso (despliegues/implementaciones):

{{% children description="true" %}} 

