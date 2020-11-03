FROM jupyter/base-notebook:latest
# Variables used in dockerfile
# set Julia version
ARG JULIA=1.5
ARG JULIA_VERSION=julia-1.5.2

# set user dir
ARG USER_DIR=/home/jovyan

# for update and apt installs, root permissions are required
USER root

# install wget and tar
RUN sudo apt update && apt install wget  -y --no-install-recommends \
   tar

# install Julia in root directory of image
WORKDIR /

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/${JULIA}/${JULIA_VERSION}-linux-x86_64.tar.gz \
     && tar -xvzf ${JULIA_VERSION}-linux-x86_64.tar.gz && rm ${JULIA_VERSION}-linux-x86_64.tar.gz

ENV JULIA_PATH /${JULIA_VERSION}
ENV PATH $JULIA_PATH/bin:$PATH

# add directory for julia package installations
ADD ./install /install

# switch back to default user of image
USER jovyan

# install julia packages
RUN julia /install/Pkg.jl

# set workdir for julia application
WORKDIR ${USER_DIR}
