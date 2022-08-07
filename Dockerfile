FROM ubuntu:20.04

# Packages update:
RUN apt-get update && apt-get -y upgrade

# Environment variable to accept the default answer:
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies:
RUN apt-get install -y python3 python3-pip libatlas-base-dev wget gfortran libhdf5-dev libc-ares-dev libeigen3-dev libopenblas-dev libblas-dev liblapack-dev
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install pybind11
RUN pip3 install Cython==0.29.21
RUN pip3 install h5py
RUN pip install gdown
RUN pip install -U matplotlib

# Change working directory:
WORKDIR /tf
RUN gdown https://drive.google.com/u/0/uc?id=1rwUdfuk032GbFydrTmyaAfI9KixTQw3C

# Install TensorFlow:
RUN pip3 install -v tensorflow-2.3.0-cp38-cp38-linux_aarch64.whl

# Install Jupyter:
WORKDIR /books
RUN pip3 install jupyter
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /usr/bin/tini
RUN chmod +x /usr/bin/tini

# Tini entrypoint: 
ENTRYPOINT ["/usr/bin/tini", "-"]

# Jupyter port:
EXPOSE 8888

# Startup command:
CMD ["jupyter", "notebook", " --port=8888", " --no-browser", " --ip=0.0.0.0", " --allow-root"]
