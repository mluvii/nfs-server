# Containerized NFSv4 server

## Description

Provides NFSv4 server image based on alpine that can be used with mluvii k8s installations.

Due to issues when mounting exported volumes only single /data export is provided with `fsid=0`.

## Usage

Create a pvc for the exported directory and mount it as `/data`:

```
    spec:
      containers:
        - name: ...
          ...
          volumeMounts:
          ...
            - mountPath: /data
              name: "data"
      volumes:
        - name: "data"
          persistentVolumeClaim:
            claimName: "..."
```