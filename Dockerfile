FROM ubuntu:22.04

# Packages update:
RUN apt-get update && apt-get -y upgrade

# Environment variable to accept the default answer:
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies:
RUN apt-get install -y python3 python3-pip libatlas-base-dev wget gfortran libhdf5-dev libc-ares-dev libeigen3-dev libopenblas-dev libblas-dev liblapack-dev
RUN pip3 install — upgrade pip
RUN pip3 install — upgrade setuptools
RUN pip3 install pybind11
RUN pip3 install Cython==0.29.21
RUN pip3 install h5py
RUN pip install gdown
RUN pip install -U matplotlib

# Change working directory:
WORKDIR /tf
RUN gdown https://drive.google.com/uc?id=11mujzVaFqa7R1_lB7q0kVPW22Ol51MPg

# Install TensorFlow:
RUN pip3 install tensorflow-2.2.0-cp37-cp37m-linux_armv7l.whl wrapt --upgrade --ignore-installed

# Install Jupyter:
WORKDIR /books
RUN pip3 install jupyter
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /usr/bin/tini
RUN chmod +x /usr/bin/tini

# Tini entrypoint: 
ENTRYPOINT [“/usr/bin/tini”, “ — “]

# Jupyter port:
EXPOSE 8888

# Startup command:
CMD [“jupyter”, “notebook”, “ — port=8888”, “ — no-browser”, “ — ip=0.0.0.0”, “ — allow-root”]