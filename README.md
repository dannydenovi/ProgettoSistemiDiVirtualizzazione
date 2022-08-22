# ProgettoSistemiDiVirtualizzazione
Repository per il progetto di Sistemi di Virtualizzazione

## Link utili

- [Guida su Medium](https://medium.com/swlh/jupyter-notebook-tensorflow-on-a-raspberry-pis-kubernetes-cluster-99f135109b5e)
- [Repository Guida medium](https://github.com/gato/tensor-on-pi)
- [Guida TensorFlow](https://www.youtube.com/watch?v=wQ8BIBpya2k)
- [Versioni TensorFlow](https://github.com/Qengineering/TensorFlow-Raspberry-Pi_64-bit)

## Docker Hub Repository

[TensorFlow e Jupyter per Raspberry Pi](https://hub.docker.com/r/dannydenovi/tensorflow_jupyter_rpi)

## Credenziali Raspberry

| hostname     | user | password |
|--------------|------|----------|
| unime-master | pi   | unime    |
| unime-w1     | pi   | unime    |


## Comandi Docker per Build

```sh
docker login
docker build . dannydenovi/tensorflow_jupyter_rpi
docker push
```
