# ProgettoSistemiDiVirtualizzazione
Repository per il progetto di Sistemi di Virtualizzazione

## Link utili

- [Guida su Medium](https://medium.com/swlh/jupyter-notebook-tensorflow-on-a-raspberry-pis-kubernetes-cluster-99f135109b5e)
- [Repository Guida medium](https://github.com/gato/tensor-on-pi)
- [Guida TensorFlow](https://www.youtube.com/watch?v=wQ8BIBpya2k)
- [Versioni TensorFlow](https://github.com/Qengineering/TensorFlow-Raspberry-Pi_64-bit)
- [Installare K3S su Raspberry Pi](https://rancher.com/docs/k3s/latest/en/advanced/#additional-preparation-for-raspberry-pi-os-setup) 

## Docker Hub Repository

[TensorFlow e Jupyter per Raspberry Pi](https://hub.docker.com/r/dannydenovi/tensorflow_jupyter_rpi)

## Credenziali Raspberry

| hostname     | user     | password |
|--------------|----------|----------|
| unime-master | master   | unime    |
| unime-w1     | worker-1 | unime    |


## Comandi Docker per Build

```sh
docker login
docker build . dannydenovi/tensorflow_jupyter_rpi
docker push
```
## Aggiunta worker

```sh
sudo k3s agent --server https://172.20.10.3:6443 --token K10fb27d70f84c26f802035a39eb71a4a7407bb7ee0e63d9e1f3c7b8ccd370be35d::server:99dd5c3a5c35a8b41e4800748ddbd067
```
